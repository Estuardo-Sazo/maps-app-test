part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitilizedEvent extends MapEvent {
  final GoogleMapController controller;
  const OnMapInitilizedEvent(this.controller);
}
