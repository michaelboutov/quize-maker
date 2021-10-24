import 'package:QuizMaker/bloc/cubit/auth_cubit.dart';
import 'package:QuizMaker/presentation/screens/add%20record/add_record_screen.dart';
import 'package:QuizMaker/presentation/screens/home/home_screen.dart';
import 'package:QuizMaker/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class MainAppScreen extends StatefulWidget {
  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  bool homeSelected = true;
  bool statsSelected = false;
  bool recordsSelected = false;
  bool settingSelected = false;
  int _currentIndex = 1;
  int selected = 0;

  final List<Widget> _screens = [
    ProfileScreen(),
    HomeScreen(),
    AddRecord(),
  ];

  void selectIcon(String selectedIcon) {
    homeSelected = false;
    statsSelected = false;
    recordsSelected = false;
    settingSelected = false;
    if (selectedIcon == 'home') {
      homeSelected = true;
    }
    if (selectedIcon == 'make') {
      statsSelected = true;
    }
    if (selectedIcon == 'records') {
      recordsSelected = true;
    }
    if (selectedIcon == 'settings') {
      settingSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) => current is AuthSignedIn,
        builder: (_, state) {
          return _screens[_currentIndex];
        },
      ),
      bottomNavigationBar: BubbleNavigationBar(
        items: [
          BubbleBarItem(
            backgroundColor: Colors.purple,
            icon: Icon(
              Icons.person,
            ),
            title: Text(
              'profile',
            ),
          ),
          BubbleBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(
              Icons.home,
            ),
            activeIcon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BubbleBarItem(
            backgroundColor: Colors.greenAccent,
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.greenAccent,
            ),
            title: Text(
              'Add',
              style: TextStyle(color: Colors.greenAccent),
            ),
          ),
        ],
        barStyle: BubbleBarStyle.vertical,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index!;
          });
        },
        iconSize: 38,
        inkEffect: true,
        inkColor: Colors.yellow,
        opacity: 0.2,
        hasNotch: false,
      ),
    );
  }
}
