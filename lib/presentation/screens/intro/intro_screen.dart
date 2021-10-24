import 'package:QuizMaker/bloc/cubit/auth_cubit.dart';
import 'package:QuizMaker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';

import 'components/description_page.dart';
import 'components/get_started.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;

    return AbsorbPointer(
      absorbing: isSigningIn,
      child: PageIndicatorContainer(
        child: PageView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const GetStarted(text: 'Swipe to learn more about the app'),
            const DescriptionPage(
              imagePath: 'assets/images/launch_image.png',
              text: 'make yore owne quizes ',
            ),
            const DescriptionPage(
              imagePath: 'assets/images/launch_image.png',
              text: 'find and complite quizes  ',
            ),
            const GetStarted(
              text: '',
            ),
          ],
        ),
        length: 3,
        indicatorColor: kPrimayColor.withOpacity(0.3),
        indicatorSelectorColor: kPrimayColor,
      ),
    );
  }
}
