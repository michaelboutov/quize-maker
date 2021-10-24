import 'package:QuizMaker/data/models/quize_score.dart';
import 'package:QuizMaker/data/repository/quize_ansers_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'quize_score_state.dart';

class QuizeScoreCubit extends Cubit<QuizeScoreState> {
  final QuizeAnsorsRepositoryBase _quizeScoreRepository;

  QuizeScoreCubit(this._quizeScoreRepository) : super(QuizeScoreInitialState());

  Future<void> getRecords(String userId) async {
    emit(QuizeScoreLoadingState());
    final recordList = await _quizeScoreRepository.getRecords(userId);
    emit(QuizeScoreReadyState(recordList));
  }

  Future<void> addRecord(String userId, QuizeScore record) async {
    emit(QuizeScoreLoadingState());
    await _quizeScoreRepository.addRecord(userId, record);
    final recordList = await _quizeScoreRepository.getRecords(userId);
    emit(QuizeScoreReadyState(recordList));
  }

  Future<void> deleteRecord(String userId, String id) async {
    emit(QuizeScoreLoadingState());
    await _quizeScoreRepository.deleteRecord(userId, id);
    final recordList = await _quizeScoreRepository.getRecords(userId);

    emit(QuizeScoreReadyState(recordList));
  }
}
