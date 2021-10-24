import 'package:QuizMaker/bloc/cubit/record_cubit.dart';
import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:QuizMaker/presentation/widgets/rounded_button.dart';
import 'package:QuizMaker/src/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastRecordsWidget extends SliverPersistentHeader {
  LastRecordsWidget() : super(delegate: LastRecordsWidgetDelegate());
}

class LastRecordsWidgetDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Header();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double get maxExtent => 581;

  @override
  double get minExtent => 581;
}

class Header extends StatelessWidget {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordCubit, RecordState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is RecordLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RecordReadyState) {
          var quizList = state.recordList;
          quizList = quizList.reversed.toList();

          return SizedBox(
            width: 400,
            height: 581,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 320,
                    height: 55,
                    child: TextField(
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
                      controller: _searchController,
                      keyboardType: TextInputType.name,
                      onSubmitted: (stringSubmitted) {
                        Navigator.pushNamed(
                          context,
                          Routes.searchPage,
                          arguments: {'stringSubmitted': stringSubmitted},
                        );

                        //arguments: stringSubmitted);
                      },
                    ),
                  ),
                ),
                GradientText(text: 'new quiz', fontSize: 40.0, width: 238),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.quiz_outlined),
                      title: Text(quizList[0].title),
                      subtitle: Text(
                        quizList[0].tag,
                      ),
                      trailing: SizedBox(
                        height: 40,
                        width: 100,
                        child: RoundedButton(
                          label: 'start',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.quiz,
                              arguments: {'quizList': quizList[0]},
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 5, 25, 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.quiz_outlined),
                      title: Text(quizList[1].title),
                      subtitle: Text(
                        quizList[1].tag,
                      ),
                      trailing: SizedBox(
                        height: 40,
                        width: 100,
                        child: RoundedButton(
                          label: 'start',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.quiz,
                              arguments: {'quizList': quizList[1]},
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 5, 25, 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.quiz_outlined),
                      title: Text(quizList[2].title),
                      subtitle: Text(
                        quizList[0].tag,
                      ),
                      trailing: SizedBox(
                        height: 40,
                        width: 100,
                        child: RoundedButton(
                          label: 'start',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.quiz,
                              arguments: {'quizList': quizList[2]},
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.quiz_outlined),
                      title: Text(quizList[3].title),
                      subtitle: Text(
                        quizList[0].tag,
                      ),
                      trailing: SizedBox(
                        height: 40,
                        width: 100,
                        child: RoundedButton(
                          label: 'start',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.quiz,
                              arguments: {'quizList': quizList[3]},
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GradientText(text: 'Category', fontSize: 40.0, width: 245),
              ],
            ),
          );
        }
        throw Exception();
      },
    );
  }
}
