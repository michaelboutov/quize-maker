import 'package:QuizMaker/data/models/record.dart';
import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:QuizMaker/presentation/widgets/rounded_button.dart';
import 'package:QuizMaker/src/navigation/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FindByCategoryScreen extends StatefulWidget {
  @override
  _FindByCategoryScreenState createState() => _FindByCategoryScreenState();
}

class _FindByCategoryScreenState extends State<FindByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    final searchString = arguments!['categoryName'].toString();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            GradientText(
              text: 'find by category  $searchString',
              fontSize: 35,
              width: 255,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('quiz')
                    .where('tag', isEqualTo: searchString)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());

                    default:
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          final _quizName = document['title'].toString();
                          final _category = document['tag'].toString();
                          final _dateTime = document['date'].toDate();
                          final _question = document['question'] as List;
                          final _id = document['id'].toString();

                          final formateData =
                              // ignore: lines_longer_than_80_chars
                              '${_dateTime.day}-${_dateTime.month}-${_dateTime.year}';
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 5,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GradientText(
                                    text: 'quize : $_quizName',
                                    fontSize: 25,
                                    width: 300,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GradientText(
                                    text: 'date : $formateData',
                                    fontSize: 20,
                                    width: 300,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GradientText(
                                    text: 'category : $_category ',
                                    fontSize: 25,
                                    width: 300,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RoundedButton(
                                  label: 'start',
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.quiz,
                                      arguments: {
                                        'quizList': Record(
                                          date: document['date'] as Timestamp,
                                          id: _id,
                                          question: _question,
                                          tag: _category,
                                          title: _quizName,
                                        )
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
