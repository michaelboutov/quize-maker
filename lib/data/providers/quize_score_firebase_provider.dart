import 'package:QuizMaker/data/models/quize_score.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class QuizeScoreFirebaseProvider {
  final _fireStore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> init() {
    return _fireStore.collection('CRUD').snapshots();
  }

  Future<void> addRecord(String userId, QuizeScore record) async {
    await _fireStore
        .collection('users/$userId/quizScore')
        .add(record.toFirebaseMap());
  }

  Future<void> deleteRecord(String userId, String id) async {
    await _fireStore.collection('users/$userId/quizScore').doc(id).delete();
  }

  Future<List<QuizeScore>> getRecords(String userId) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users/$userId/quizScore')
        .orderBy('date')
        .get();
    final allData = querySnapshot.docs;

    final List<QuizeScore> recordsList = [];
    for (final record in allData) {
      final recordId = record.id;
      final recordTitle = record['title'] as String;
      final recordTag = record['tag'] as String;
      final recordDate = record['date'] as Timestamp;
      final ansers = record['ansers'] as List;

      final newQuizeScore = QuizeScore(
        id: recordId,
        title: recordTitle,
        tag: recordTag,
        date: recordDate,
        ansers: ansers,
      );
      recordsList.add(newQuizeScore);
    }
    return recordsList;
  }
}
