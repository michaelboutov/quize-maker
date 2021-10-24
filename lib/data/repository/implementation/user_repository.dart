import 'dart:io';

import 'package:QuizMaker/data/models/user_model.dart';
import 'package:QuizMaker/data/providers/user_firebase_provider.dart';

import '../user_repository.dart';

class UserRepository extends UserRepositoryBase {
  final provider = UserFirebaseProvider();

  @override
  Future<UserModel?> getUser() async {
    return provider.getUser();
  }

  @override
  Future<void> saveUser(UserModel user, File? image) async {
    provider.saveUser(user, image);
  }
}
