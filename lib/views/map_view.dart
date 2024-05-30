import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app1/blocs/blocs.dart';
import 'package:maps_app1/theme/theme.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;

  const MapView({
    super.key,
    required this.initialLocation,
  });

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );

    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: Listener(
        onPointerHover: (pointerMoveEvent) => mapBloc.add(OnStopFollowingUserEvent()),
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: true,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          style: jsonEncode(uberMapTheme),

          onMapCreated: (controller) =>
              mapBloc.add(OnMapInitilizedEvent(controller)),

          //TODO: Markers
          // polygons: _polygons,
          //Cuando se mueve el mapa
        ),
      ),
    );
  }
}
