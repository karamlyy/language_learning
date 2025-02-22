/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/repository/word_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class NewWordCubit extends Cubit<BaseState> {
  NewWordCubit() : super(InitialState());

  final _wordRepository = getIt<WordRepository>();
  final _homeRepository = getIt<HomeRepository>();

  void getAllLanguagePairs() async {
    emit(LoadingState());
    final result = await _homeRepository.getAllLanguagePairs();
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        emit(SuccessState(data: data));
      },
    );
  }

  void addNewWord(NewWordInput input) async {
    emit(LoadingState());
    final result = await _wordRepository.addNewWord(input);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (_) {
        Navigation.pushReplacementNamed(Routes.newWord);
      },
    );
  }
}

 */
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/data/model/home/language_pair_model.dart';
import 'package:language_learning/data/model/language/language_model.dart';
import 'package:language_learning/data/repository/file_repository.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/repository/word_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;


class NewWordCubit extends Cubit<BaseState> {
  NewWordCubit() : super(InitialState()) {
    getAllLanguagePairs();
  }

  final _wordRepository = getIt<WordRepository>();
  final _homeRepository = getIt<HomeRepository>();
  final _fileRepository = getIt<FileRepository>();

  final _languagePairController = BehaviorSubject<List<LanguagePairModel>>();

  Stream<List<LanguagePairModel>> get languagePairController =>
      _languagePairController.stream;

  Future<void> getAllLanguagePairs() async {
    final result = await _homeRepository.getAllLanguagePairs();
    result.fold(
      (error) {
        emit(FailureState(errorMessage: error.error));
      },
      (data) {
        _languagePairController.add(data);
      },
    );
  }

  Future<void> addNewWord(NewWordInput input) async {
    emit(LoadingState());
    final result = await _wordRepository.addNewWord(input);
    result.fold(
      (error) => emit(
        FailureState(errorMessage: error.error),
      ),
      (data) {
        Navigation.pushReplacementNamed(Routes.newWord);
      },
    );
  }

  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission granted
    } else if (status.isDenied) {
      // Permission denied, handle gracefully
    } else if (status.isPermanentlyDenied) {
      // Open app settings or show rationale
      await openAppSettings();
    }
  }
  Future<void> downloadTemplate(String url) async {
    try {
      //await requestStoragePermission();

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final directory = await getExternalStorageDirectory();
        if (directory == null) {
          print('Could not find the external storage directory.');
          return;
        }

        final filePath = '${directory.path}/VocabularyTemplate.xlsx';

        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes, flush: true);

        print('File downloaded and saved at: $filePath');
      } else {
        print('Failed to download file. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  Future<void> uploadTemplate() async {
    emit(LoadingState());
    final result = await _fileRepository.uploadTemplate();
    result.fold(
          (error) => emit(
        FailureState(errorMessage: error.error),
      ),
          (data) {
        print('uploaded');

      },
    );
  }


}
