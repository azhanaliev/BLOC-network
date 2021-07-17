import 'package:bloc_job_with_network/bloc/user_event.dart';
import 'package:bloc_job_with_network/bloc/user_state.dart';
import 'package:bloc_job_with_network/models/user.dart';
import 'package:bloc_job_with_network/services/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc(this.usersRepository, UserState initialState) : super(initialState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}
