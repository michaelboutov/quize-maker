import 'package:QuizMaker/data/models/quize_score.dart';

abstract class QuizeAnsorsRepositoryBase {
  Future<List<QuizeScore>> getRecords(String userId);
  Future<void> addRecord(String userId, QuizeScore record);
  Future<void> deleteRecord(String userId, String id);
}
