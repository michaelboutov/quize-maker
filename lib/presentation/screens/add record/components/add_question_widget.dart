part of 'package:QuizMaker/presentation/screens/add%20record/add_record_screen.dart';

class AddQuestion extends StatefulWidget {
  final int count;
  const AddQuestion({Key? key, required this.count}) : super(key: key);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _questionController = TextEditingController();
  final _anserOneController = TextEditingController();
  final _anserTowController = TextEditingController();
  final _anserThreeController = TextEditingController();
  final _anserFourController = TextEditingController();
  bool _ansoreOne = false;
  bool _ansoreTwo = false;
  bool _ansoreThree = false;
  bool _ansoreFour = false;
  final addIcon = const Icon(
    Icons.add_task,
    color: Colors.black,
  );
  final addText = const Text(
    'add question',
    style: TextStyle(color: Colors.black),
  );
  bool addButtonhasBeenPressed = false;
  bool newQuestionButtonhasBeenPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Question _submitQuestion() {
    final newQuestion = Question(
      question: _questionController.text,
      ansorOne: [_anserOneController.text, _ansoreOne],
      ansorTwo: [_anserTowController.text, _ansoreTwo],
      ansorThree: [_anserThreeController.text, _ansoreThree],
      ansorFour: [_anserFourController.text, _ansoreFour],
    );

    return newQuestion;
  }

  @override
  Widget build(BuildContext context) {
    int count = widget.count;
    count++;
    return SizedBox(
      width: 330,
      height: 780,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'add question number $count ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          CustomTextField(
            controller: _questionController,
            hintText: '',
            keyboardType: TextInputType.text,
            onSubmit: () {
              questions.add(_submitQuestion().toFirebaseMap());
            },
            prefixIcon: Icon(Icons.quiz_outlined, color: Colors.blueAccent),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'add first ansare option ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _anserOneController,
                  hintText: '',
                  keyboardType: TextInputType.text,
                  onSubmit: () async {},
                  prefixIcon: Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(' wrong/right'),
                  SizedBox(height: 3),
                  CupertinoSwitch(
                    trackColor: Colors.redAccent,
                    value: _ansoreOne,
                    onChanged: (bool value) {
                      setState(() {
                        _ansoreOne = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'add second ansare option  ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _anserTowController,
                  hintText: '',
                  keyboardType: TextInputType.text,
                  onSubmit: () {
                    questions.add(_submitQuestion());
                  },
                  prefixIcon: Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(' wrong/right'),
                  SizedBox(height: 3),
                  CupertinoSwitch(
                    trackColor: Colors.redAccent,
                    value: _ansoreTwo,
                    onChanged: (bool value) {
                      setState(() {
                        _ansoreTwo = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'add third ansare option  ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _anserThreeController,
                  hintText: '',
                  keyboardType: TextInputType.text,
                  onSubmit: () {
                    questions.add(_submitQuestion());
                  },
                  prefixIcon: Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(' wrong/right'),
                  SizedBox(height: 3),
                  CupertinoSwitch(
                    trackColor: Colors.redAccent,
                    value: _ansoreThree,
                    onChanged: (bool value) {
                      setState(() {
                        _ansoreThree = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'add fourth ansare option ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _anserFourController,
                  hintText: '',
                  keyboardType: TextInputType.text,
                  onSubmit: () {
                    questions.add(_submitQuestion());
                  },
                  prefixIcon: Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(' wrong/right'),
                  SizedBox(height: 3),
                  CupertinoSwitch(
                    trackColor: Colors.redAccent,
                    value: _ansoreFour,
                    onChanged: (bool value) {
                      setState(() {
                        _ansoreFour = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
          Container(width: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                questions.add(_submitQuestion().toFirebaseMap());
                setState(() {
                  addButtonhasBeenPressed = !addButtonhasBeenPressed;
                });
              },
              style: ElevatedButton.styleFrom(
                primary:
                    addButtonhasBeenPressed ? Colors.greenAccent : Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              child: Column(
                children: [addText],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                questions.add(_submitQuestion().toFirebaseMap());
                numberOfQuestions.value++;
                setState(() {
                  newQuestionButtonhasBeenPressed =
                      !newQuestionButtonhasBeenPressed;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: newQuestionButtonhasBeenPressed
                    ? Colors.greenAccent
                    : Colors.white,
                fixedSize: Size(100, 20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              child: Icon(
                Icons.add_circle_outline,
                size: 30,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
