import 'package:bloc_job_with_network/bloc/user_bloc.dart';
import 'package:bloc_job_with_network/bloc/user_state.dart';
import 'package:bloc_job_with_network/services/users_repository.dart';
import 'package:bloc_job_with_network/widgets/action_buttons.dart';
import 'package:bloc_job_with_network/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();
  final userEmptyState = UserEmptyState();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository, userEmptyState),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
