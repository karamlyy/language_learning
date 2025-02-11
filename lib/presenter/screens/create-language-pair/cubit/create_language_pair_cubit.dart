import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_language_pair_state.dart';

class CreateLanguagePairCubit extends Cubit<CreateLanguagePairState> {
  CreateLanguagePairCubit() : super(CreateLanguagePairInitial());
}
