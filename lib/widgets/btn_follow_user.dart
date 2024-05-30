import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app1/blocs/blocs.dart';
import 'package:maps_app1/ui/ui.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                  state.isFollowingUser
                      ? Icons.directions_run_outlined
                      : Icons.hail_outlined,
                  color: Colors.black87),
              onPressed: () {
                // TODO Tarea
                mapBloc.add(OnStartFollowingUserEvent());
              },
            );
          },
        ),
      ),
    );
  }
}
