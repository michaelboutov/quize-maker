import 'package:QuizMaker/presentation/screens/auth/auth_screen.dart';
import 'package:QuizMaker/presentation/screens/category/find_by_category_screen.dart';
import 'package:QuizMaker/presentation/screens/intro/intro_screen.dart';
import 'package:QuizMaker/presentation/screens/main/main_app_screen.dart';
import 'package:QuizMaker/presentation/screens/profile/profile_screen.dart';
import 'package:QuizMaker/presentation/screens/quiz/quiz_screen.dart';
import 'package:QuizMaker/presentation/screens/quiz_score/quize_score.dart';
import 'package:QuizMaker/presentation/screens/search/search_screen.dart';
import 'package:QuizMaker/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const auth = '/auth';
  static const main = '/main';
  static const profile = '/profile';
  static const quiz = '/quiz';
  static const quizeScore = '/quizeScore';
  static const searchPage = '/searchPage';
  static const findByCategory = '/findByCategory';

  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case quiz:
        return _buildRouteSetting(settings, QuizScreen());
      case splash:
        return _buildRoute(SplashScreen());
      case intro:
        return _buildRoute(IntroScreen());
      case auth:
        return _buildRoute(AuthScreen());
      case main:
        return _buildRoute(MainAppScreen());
      case profile:
        return _buildRoute(ProfileScreen());
      case quizeScore:
        return _buildRoute(QuizesScoreWidget());
      case searchPage:
        return _buildRouteSetting(settings, SearchPage());
      case findByCategory:
        return _buildRouteSetting(settings, FindByCategoryScreen());

      default:
        throw Exception('Route does not exist');
    }
  }

  static MaterialPageRoute _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }

  static MaterialPageRoute _buildRouteSetting(
    RouteSettings settings,
    Widget builder,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
