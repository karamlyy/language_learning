import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/data/model/home/language_pair_model.dart';
import 'package:language_learning/data/repository/file_repository.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/repository/word_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';
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



}
