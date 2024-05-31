import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app1/blocs/blocs.dart';
import 'package:maps_app1/views/views.dart';
import 'package:maps_app1/widgets/widgets.dart';

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
    return Scaffold(
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, locationState) {
            if (locationState.lastKnowLocation == null) {
              return const Center(child: Text('Esperando por la ubicación...'));
            }

            return BlocBuilder<MapBloc, MapState>(
              builder: (context, mapState) {
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      MapView(
                        initialLocation: locationState.lastKnowLocation!,
                        polylines: mapState.polylines.values.toSet(),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BtnFollowUser(),
            BtnCurrentLocation(),
          ],
        ));
  }
}
