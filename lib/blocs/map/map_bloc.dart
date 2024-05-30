import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app1/blocs/blocs.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;

  GoogleMapController? _mapController;

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<OnMapInitilizedEvent>(_onInitMap);

    locationBloc.stream.listen((locationState) {
      if(state.followUser) return;
      if(locationState.lastKnowLocation == null) return;

      moveCamera(locationState.lastKnowLocation!);
    });
  }

  void _onInitMap(OnMapInitilizedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;

    emit(state.copyWith(isMapInitilized: true));
  }

  void moveCamera(LatLng newLatLng) {
    final cameraUpdate = CameraUpdate.newLatLng(newLatLng);
    _mapController?.animateCamera(cameraUpdate);
  }
}
