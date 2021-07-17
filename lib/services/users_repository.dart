import 'package:bloc_job_with_network/models/user.dart';
import 'package:bloc_job_with_network/services/user_api_provider.dart';

class UsersRepository{
  UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUser();
}