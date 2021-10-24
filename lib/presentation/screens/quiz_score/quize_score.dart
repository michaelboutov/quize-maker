import 'package:QuizMaker/bloc/cubit/quize_score_cubit.dart';
import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizesScoreWidget extends StatefulWidget {
  @override
  _QuizesScoreWidgetState createState() => _QuizesScoreWidgetState();
}

class _QuizesScoreWidgetState extends State<QuizesScoreWidget> {
  double? colculateScore(List ansers) {
    var score =
        100 / ansers.length * ansers.where((element) => element as bool).length;
    if (score > 0) {
      return score;
    } else {
      return score = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizeScoreCubit, QuizeScoreState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is QuizeScoreLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is QuizeScoreReadyState) {
          final quizesScoreList = state.quizeScoreList;

          return Scaffold(
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  GradientText(
                    text: 'your \n   complete \n          quizes',
                    fontSize: 35,
                    width: 300,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: quizesScoreList.length,
                    itemBuilder: (context, index) {
                      final quizNAme = quizesScoreList[index].title;
                      final dateTime = quizesScoreList[index].date.toDate();
                      final formateData =
                          '${dateTime.day}-${dateTime.month}-${dateTime.year}';
                      final score =
                          colculateScore(quizesScoreList[index].ansers);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientText(
                                  text: 'quize : $quizNAme',
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
                                  text: 'score : $score ',
                                  fontSize: 25,
                                  width: 300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        throw Exception();
      },
    );
  }
}
