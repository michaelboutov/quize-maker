import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Record extends Equatable {
  final String id;
  final String title;
  final String tag;

  final Timestamp date;
  final List question;

  const Record({
    required this.id,
    required this.title,
    required this.tag,
    required this.date,
    required this.question,
  });

  @override
  List<Object?> get props => [id];

  Map<String, Object?> toFirebaseMap() {
    return <String, Object?>{
      'id': id,
      'title': title,
      'tag': tag,
      'date': date,
      'question': question,
    };
  }

  Record.fromFirebaseMap(Map<String?, Object?> data)
      : id = data['id']! as String,
        title = data['title']! as String,
        tag = data['tag']! as String,
        date = data['date']! as Timestamp,
        question = data['question']! as List;
}

class Question {
  final String question;
  final List ansorOne;
  final List ansorTwo;
  final List ansorThree;
  final List ansorFour;

  Question({
    required this.question,
    required this.ansorOne,
    required this.ansorTwo,
    required this.ansorThree,
    required this.ansorFour,
  });

  Map<String, Object?> toFirebaseMap() {
    return <String, Object?>{
      'question': question,
      'ansorOne': ansorOne,
      'ansorTwo': ansorTwo,
      'ansorThree': ansorThree,
      'ansorFour': ansorFour,
    };
  }

  Question.fromFirebaseMap(Map<String?, Object?> data)
      : question = data['question']! as String,
        ansorOne = data['ansorOne']! as List,
        ansorTwo = data['ansorTwo']! as List,
        ansorThree = data['ansorThree']! as List,
        ansorFour = data['ansorFour']! as List;
}
