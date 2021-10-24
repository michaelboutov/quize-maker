import 'package:QuizMaker/data/models/record.dart';
import 'package:QuizMaker/data/providers/record_firebase_provider.dart';
import 'package:QuizMaker/data/repository/record_repository.dart';

class RecordRepository extends RecordRepositoryBase {
  final provider = RecordFirebaseProvider();
  @override
  Future<void> addRecord(String userId, Record record) async {
    provider.addRecord(userId, record);
  }

  @override
  Future<void> deleteRecord(String userId, String id) async {
    provider.deleteRecord(userId, id);
  }

  @override
  Future<List<Record>> getRecords(String userId) async {
    final records = provider.getRecords(userId);
    return records;
  }
}
