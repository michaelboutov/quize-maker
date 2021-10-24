import 'dart:io';

import 'package:QuizMaker/data/models/user_model.dart';

abstract class UserRepositoryBase {
  Future<UserModel?> getUser();
  Future<void> saveUser(UserModel user, File? image);
}
