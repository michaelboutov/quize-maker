import 'package:QuizMaker/bloc/cubit/auth_cubit.dart';
import 'package:QuizMaker/bloc/cubit/user_cubit.dart';
import 'package:QuizMaker/presentation/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (ctx, inner) => [
          CupertinoSliverNavigationBar(
            largeTitle: GradientText(
              text: 'Profile',
              fontSize: 30,
              width: 150,
            ),
            previousPageTitle: 'Settings',
          )
        ],
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserReadyState) {
              return ListView(
                children: [
                  UserProfile(
                    user: state.user,
                    pickedImage: state.pickedImage,
                  ),
                  ListTile(
                    title: Text(
                      'LogOut',
                      style: TextStyle(color: Colors.red),
                    ),
                    leading: Icon(Icons.logout, color: Colors.red),
                    onTap: () => context.read<AuthCubit>().signOut(),
                  ),
                ],
              );
            }
            throw Exception();
          },
        ),
      ),
    );
  }
}
