import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final currency = NumberFormat('#,##0.00', 'en_US');
const Color kPrimayColor = Colors.blueAccent;
const Color kAccentColor = Colors.yellowAccent;
const Color kTextColor = Colors.black;
const Color kBackgroundColor = Colors.white;
const kDefaultPadding = 20.0;

final kPrimayGradient = LinearGradient(
  colors: [
    Colors.purple[400]!,
    Colors.blueAccent[200]!,
    Colors.greenAccent[200]!
  ],
);

final rightAnsweGradient = LinearGradient(
  colors: [
    Colors.green[400]!,
    Colors.yellow[200]!,
    Colors.greenAccent[200]!,
  ],
);

final wrongAnswerGradient =
    LinearGradient(colors: const [Colors.red, Colors.black, Colors.red]);
