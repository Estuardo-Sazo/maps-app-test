part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool followingUser;

  // TODO
  // Ultimo Geolocalizacion
  // Historial de geolocalizaciones

  const LocationState({this.followingUser = false});

  @override
  List<Object> get props => [followingUser];
}
