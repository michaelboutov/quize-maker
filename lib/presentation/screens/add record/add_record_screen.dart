import 'package:QuizMaker/bloc/cubit/auth_cubit.dart';
import 'package:QuizMaker/bloc/cubit/record_cubit.dart';
import 'package:QuizMaker/bloc/cubit/user_cubit.dart';
import 'package:QuizMaker/data/models/record.dart';
import 'package:QuizMaker/data/repository/implementation/user_repository.dart';
import 'package:QuizMaker/presentation/widgets/custom_textfield.dart';
import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:QuizMaker/presentation/widgets/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/buttons_add_record.dart';

part 'components/add_question_widget.dart';

List questions = [];
final numberOfQuestions = ValueNotifier(1);

class AddRecord extends StatefulWidget {
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  final _nameController = TextEditingController();
  final _conceptController = TextEditingController();
  final _tagController = TextEditingController();
  Timestamp dateTime = Timestamp.now();

  final Map<int, Widget> children = const <int, Widget>{
    0: Text('Expense'),
    1: Text('Income'),
  };

  final Map<int, Widget> incomeType = const <int, Widget>{
    0: Text('Active Income'),
    1: Text('Pasive Income'),
  };

  int? incomeTypeVal = 1;
  int? currentValue = 0;
  String recordTag = 'AI';
  late String userId;

  Future<void> _submitData() async {
    final userId = (context.read<AuthCubit>().state as AuthSignedIn).user.uid;
    if (currentValue == 0) {
      recordTag = _tagController.text;
    }
    if (currentValue == 1) {
      incomeTypeVal == 0 ? recordTag = 'AI' : recordTag = 'PI';
    }
    final newRecord = Record(
      id: userId,
      title: _nameController.text,
      tag: recordTag,
      date: dateTime,
      question: questions,
    );

    await context.read<RecordCubit>().addRecord(recordTag, newRecord);
  }

  @override
  Widget build(BuildContext context) {
    Widget makeDismissible({required Widget child}) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
    }

    return BlocProvider(
      create: (context) => UserCubit(UserRepository())..getUser(),
      child: makeDismissible(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 30,
              ),
              GradientText(
                text: '  create new quiz',
                fontSize: 40.0,
                width: 238,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _nameController,
                prefixIcon:
                    Icon(Icons.add_circle_outlined, color: Colors.blueAccent),
                hintText: 'Enter quiz name',
                keyboardType: TextInputType.text,
                onSubmit: _submitData,
              ),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                controller: _tagController,
                prefixIcon: Icon(Icons.notes_rounded, color: Colors.blueAccent),
                hintText: 'Enter category',
                keyboardType: TextInputType.name,
                onSubmit: _submitData,
              ),
              SizedBox(
                height: 25,
              ),
              ValueListenableBuilder<int>(
                valueListenable: numberOfQuestions,
                builder: (context, value, child) {
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: numberOfQuestions.value,
                    itemBuilder: (context, numberOfQuestions) {
                      return AddQuestion(
                        count: numberOfQuestions,
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 25),
              SizedBox(
                width: 300,
                child: Row(
                  children: [
                    ButtonAddRecord(
                      color: Colors.black12,
                      title: 'Cancel',
                      onPress: () {
                        _nameController.clear();
                        _conceptController.clear();
                        _tagController.clear();
                        Navigator.pushNamed(context, '/main');
                      },
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      width: 200,
                      child: RoundedButton(
                        onPressed: () {
                          _submitData();
                          CoolAlert.show(
                            confirmBtnColor: Colors.purple[400]!,
                            backgroundColor: Colors.white,
                            context: context,
                            type: CoolAlertType.success,
                            // ignore: prefer_interpolation_to_compose_strings
                            text: ' your quize is saved ',
                            onConfirmBtnTap: () =>
                                Navigator.pushNamed(context, '/main'),
                          );
                        },
                        label: 'save',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }
}
