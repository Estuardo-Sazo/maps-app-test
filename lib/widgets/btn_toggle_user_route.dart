import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app1/blocs/blocs.dart';
import 'package:maps_app1/ui/ui.dart';

class BtnToggleUserRoute extends StatelessWidget {
  const BtnToggleUserRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,
        child: IconButton(
            icon: const Icon(Icons.more_horiz_rounded, color: Colors.black87),
            onPressed: () {
              mapBloc.add(OnToggleShowRouteEvent());
            }),
      ),
    );
  }
}
