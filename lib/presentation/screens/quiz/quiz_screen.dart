import 'package:QuizMaker/bloc/cubit/auth_cubit.dart';
import 'package:QuizMaker/bloc/cubit/quize_score_cubit.dart';
import 'package:QuizMaker/bloc/cubit/user_cubit.dart';
import 'package:QuizMaker/data/models/quize_score.dart';
import 'package:QuizMaker/data/models/record.dart';
import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:QuizMaker/presentation/widgets/question_button.dart';
import 'package:QuizMaker/presentation/widgets/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<bool> rightAnsers = [];
  Future<void> _submitAnsers({
    required String title,
    required String tag,
  }) async {
    final userId = (context.read<AuthCubit>().state as AuthSignedIn).user.uid;

    final newScoreQuiz = QuizeScore(
      ansers: rightAnsers,
      date: Timestamp.now(),
      id: userId,
      tag: tag,
      title: title,
    );

    await context.read<QuizeScoreCubit>().addRecord(userId, newScoreQuiz);
  }

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
    final arguments = ModalRoute.of(context)!.settings.arguments as Map?;

    final quiz = arguments?['quizList'] as Record;
    final quizQuestion = quiz.question;
    final quizName = quiz.title;

    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        if (state is UserLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is UserReadyState) {
          return Scaffold(
            body: ListView(
              physics: ScrollPhysics(),
              children: [
                const SizedBox(
                  height: 40,
                ),
                GradientText(
                  text: quizName,
                  width: 300,
                  fontSize: 35.0,
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: quizQuestion.length,
                  itemBuilder: (context, index) {
                    final numQuestion = index + 1;
                    final question = Question.fromFirebaseMap(
                      quizQuestion[index] as Map<String, dynamic>,
                    );
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GradientText(
                            text: 'question  $numQuestion :',
                            width: 300,
                            fontSize: 35.0,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: GradientText(
                            text: question.question,
                            width: 300,
                            fontSize: 25.0,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        QuestionButton(
                          answer: question.ansorOne[1] as bool,
                          label: question.ansorOne[0].toString(),
                          onPressed: () {
                            if (question.ansorOne[1] as bool) {
                              rightAnsers.add(true);
                            } else {
                              rightAnsers.add(false);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionButton(
                          answer: question.ansorTwo[1] as bool,
                          label: question.ansorTwo[0].toString(),
                          onPressed: () {
                            if (question.ansorTwo[1] as bool) {
                              rightAnsers.add(true);
                            } else {
                              rightAnsers.add(false);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionButton(
                          answer: question.ansorThree[1] as bool,
                          label: question.ansorThree[0].toString(),
                          onPressed: () {
                            if (question.ansorThree[1] as bool) {
                              rightAnsers.add(true);
                            } else {
                              rightAnsers.add(false);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        QuestionButton(
                          answer: question.ansorFour[1] as bool,
                          label: question.ansorFour[0].toString(),
                          onPressed: () {
                            if (question.ansorFour[1] as bool) {
                              rightAnsers.add(true);
                            } else {
                              rightAnsers.add(false);
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 160,
                    ),
                    SizedBox(
                      width: 180,
                      child: RoundedButton(
                        onPressed: () {
                          _submitAnsers(title: quizName, tag: quiz.tag);
                          CoolAlert.show(
                            confirmBtnColor: Colors.purple[400]!,
                            backgroundColor: Colors.white,
                            context: context,
                            type: CoolAlertType.success,
                            // ignore: prefer_interpolation_to_compose_strings
                            text: ' your score is ' +
                                colculateScore(rightAnsers).toString() +
                                '%',
                            onConfirmBtnTap: () =>
                                Navigator.pushNamed(context, '/main'),
                          );
                        },
                        label: 'finish',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        }
        throw Exception();
      },
    );
  }
}
