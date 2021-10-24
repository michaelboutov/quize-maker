import 'package:QuizMaker/data/models/record.dart';
import 'package:QuizMaker/data/repository/record_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  final RecordRepositoryBase _recordRepository;

  RecordCubit(this._recordRepository) : super(RecordInitialState());

  Future<void> getRecords(String userId) async {
    emit(RecordLoadingState());
    final recordList = await _recordRepository.getRecords(userId);
    emit(RecordReadyState(recordList));
  }

  Future<void> addRecord(String userId, Record record) async {
    emit(RecordLoadingState());
    await _recordRepository.addRecord(userId, record);
    final recordList = await _recordRepository.getRecords(userId);
    emit(RecordReadyState(recordList));
  }

  Future<void> deleteRecord(String userId, String id) async {
    emit(RecordLoadingState());
    await _recordRepository.deleteRecord(userId, id);
    final recordList = await _recordRepository.getRecords(userId);

    emit(RecordReadyState(recordList));
  }
}
