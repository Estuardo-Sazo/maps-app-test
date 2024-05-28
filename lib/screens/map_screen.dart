import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app1/blocs/blocs.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    //locationBloc.getCurrentLocation();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
      if (state.lastKnowLocation == null) {
        return const Center(child: Text('Esperando por la ubicación...'));
      }

      final CameraPosition initialCameraPosition = CameraPosition(
        target: state.lastKnowLocation!,
        zoom: 15,
      );
      return GoogleMap(
        initialCameraPosition: initialCameraPosition,
      );
    }));
  }
}
