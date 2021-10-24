import 'package:QuizMaker/data/models/quize_score.dart';
import 'package:QuizMaker/data/providers/quize_score_firebase_provider.dart';
import '../quize_ansers_repository.dart';

class QuizeAnsorsRepository extends QuizeAnsorsRepositoryBase {
  final provider = QuizeScoreFirebaseProvider();
  @override
  Future<void> addRecord(String userId, QuizeScore record) async {
    provider.addRecord(userId, record);
  }

  @override
  Future<void> deleteRecord(String userId, String id) async {
    provider.deleteRecord(userId, id);
  }

  @override
  Future<List<QuizeScore>> getRecords(String userId) async {
    final records = provider.getRecords(userId);
    return records;
  }
}
