import 'package:bloc_job_with_network/bloc/user_bloc.dart';
import 'package:bloc_job_with_network/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserLoadEvent());
          },
          child: Text('Load'),
          style: ElevatedButton.styleFrom(primary: Colors.green),
        ),
        SizedBox(
          width: 8,
        ),
        ElevatedButton(
          onPressed: () {
            userBloc.add(UserClearEvent());
          },
          child: Text('Reset'),
          style: ElevatedButton.styleFrom(primary: Colors.red),
        )
      ],
    );
  }
}
