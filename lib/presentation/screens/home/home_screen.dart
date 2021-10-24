import 'package:QuizMaker/bloc/cubit/user_cubit.dart';
import 'package:QuizMaker/data/repository/implementation/user_repository.dart';
import 'package:QuizMaker/presentation/screens/home/components/find_by_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/header.dart';
import 'components/last_records.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> homeWidgets = [
    HomeHeader(),
    LastRecordsWidget(),
    FindByCategoryWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserRepository())..getUser(),
      child: CustomScrollView(
        slivers: homeWidgets,
      ),
    );
  }
}
