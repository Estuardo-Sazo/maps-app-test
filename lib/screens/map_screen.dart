import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app1/blocs/blocs.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();

    final locationBloc = BlocProvider.of<LocationBloc>(context);

    //locationBloc.getCurrentLocation();
    locationBloc.startFollowingUser();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('GPS Map Screen'),
      ),
    );
  }
}
