import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String imagePath;
  final String text;

  const DescriptionPage({
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Image.asset(
            imagePath,
            width: 500,
            height: 500,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.center,
            child: GradientText(
              text: text,
              fontSize: 25,
              width: 280,
            ),
          ),
        )
      ],
    );
  }
}
