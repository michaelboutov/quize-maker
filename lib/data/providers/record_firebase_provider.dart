import 'package:QuizMaker/data/models/record.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordFirebaseProvider {
  final _fireStore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> init() {
    return _fireStore.collection('CRUD').snapshots();
  }

  Future<void> addRecord(String userId, Record record) async {
    await _fireStore.collection('quiz').add(record.toFirebaseMap());
  }

  Future<void> deleteRecord(String userId, String id) async {
    await _fireStore.collection('users/$userId/transactions').doc(id).delete();
  }

  Future<List<Record>> getRecords(String userId) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('quiz')
        .orderBy('date')
        .get();
    final allData = querySnapshot.docs;

    final List<Record> recordsList = [];
    for (final record in allData) {
      final recordId = record.id;
      final recordTitle = record['title'] as String;
      final recordTag = record['tag'] as String;
      final recordDate = record['date'] as Timestamp;
      final questions = record['question'] as List;

      final newRecord = Record(
        id: recordId,
        title: recordTitle,
        tag: recordTag,
        date: recordDate,
        question: questions,
      );
      recordsList.add(newRecord);
    }
    return recordsList;
  }
}












//   Future<List<Record>> getRecords(String userId) async {
//     final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('quiz')
//         .orderBy('date')
//         .get();
//     final allData = querySnapshot.docs;

//     final List<Record> recordsList = [];
//     for (final record in allData) {
//       final recordId = record.id;
//       final recordTitle = record['title'] as String;
//       final recordTag = record['tag'] as String;
//       final recordDate = record['date'] as Timestamp;
//       final questions = record['question'] as List;

//       final newRecord = Record(
//         id: recordId,
//         title: recordTitle,
//         tag: recordTag,
//         date: recordDate,
//         question: questions,
//       );
//       recordsList.add(newRecord);
//     }
//     return recordsList;
//   }
// }
