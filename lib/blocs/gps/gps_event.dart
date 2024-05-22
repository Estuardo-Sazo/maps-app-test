part of 'gps_bloc.dart';

sealed class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

class GpsAndPermissionEvent extends GpsEvent {
  final bool isPermissionGranted;
  final bool isGpsEnabled;

  const GpsAndPermissionEvent({
    required this.isGpsEnabled,
    required this.isPermissionGranted,
  });
}
