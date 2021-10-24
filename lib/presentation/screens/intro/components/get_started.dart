import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:QuizMaker/presentation/widgets/rounded_button.dart';
import 'package:QuizMaker/src/navigation/routes.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  final String text;

  const GetStarted({required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          SizedBox(height: 50),
          GradientText(text: 'Welcome', fontSize: 40, width: 250),
          SizedBox(height: 140),
          RoundedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.auth);
            },
            label: 'Get Started',
          ),
          SizedBox(height: 60),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
