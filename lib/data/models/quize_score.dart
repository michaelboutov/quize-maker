import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class QuizeScore extends Equatable {
  final String id;
  final String title;
  final String tag;

  final Timestamp date;
  final List ansers;

  const QuizeScore({
    required this.id,
    required this.title,
    required this.tag,
    required this.date,
    required this.ansers,
  });

  @override
  List<Object?> get props => [id];

  Map<String, Object?> toFirebaseMap() {
    return <String, Object?>{
      'id': id,
      'title': title,
      'tag': tag,
      'date': date,
      'ansers': ansers,
    };
  }

  QuizeScore.fromFirebaseMap(Map<String?, Object?> data)
      : id = data['id']! as String,
        title = data['title']! as String,
        tag = data['tag']! as String,
        date = data['date']! as Timestamp,
        ansers = data['ansers']! as List;
}
