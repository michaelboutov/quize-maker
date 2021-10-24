import 'package:QuizMaker/data/models/record.dart';
import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:QuizMaker/presentation/widgets/rounded_button.dart';
import 'package:QuizMaker/src/navigation/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _pres = TextEditingController();
  String searchString = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    searchString = arguments!['stringSubmitted'].toString();
    _pres = TextEditingController(text: searchString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            GradientText(text: 'find quize', fontSize: 37, width: 250),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _pres,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black45),
                        hintTextDirection: TextDirection.ltr,
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.blueAccent.withAlpha(40),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchString = value.toLowerCase();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('quiz')
                          .where('title', isEqualTo: searchString)
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
                                                date: document['date']
                                                    as Timestamp,
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
            )
          ],
        ),
      ),
    );
  }
}
