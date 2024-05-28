part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class OnNewLocationEvent extends LocationEvent {
  final LatLng newLocation;

  const OnNewLocationEvent(this.newLocation);
}

class OnStartFollingUser extends LocationEvent {}

class OnStopFollingUser extends LocationEvent {}
