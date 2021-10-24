import 'package:QuizMaker/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionButton extends StatefulWidget {
  final Function onPressed;
  final String label;
  final bool answer;

  const QuestionButton({
    required this.onPressed,
    required this.label,
    required this.answer,
  });

  @override
  State<QuestionButton> createState() => _QuestionButtonState();
}

class _QuestionButtonState extends State<QuestionButton> {
  var _gradient = kPrimayGradient;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.answer == true) {
          setState(() {
            _gradient = rightAnsweGradient;
          });
        } else {
          setState(() {
            _gradient = wrongAnswerGradient;
          });
        }

        widget.onPressed();
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: _gradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 300,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: GoogleFonts.chango(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
