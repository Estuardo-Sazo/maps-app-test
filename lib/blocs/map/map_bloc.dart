import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  GoogleMapController? _mapController;

  MapBloc() : super(const MapState()) {
    on<OnMapInitilizedEvent>(_onInitMap);
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
