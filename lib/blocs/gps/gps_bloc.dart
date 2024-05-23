import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? gpsStatusSubscription;

  GpsBloc()
      : super(const GpsState(
            isGpsEnabled: false, isGpsPermissionGranted: false)) {
    on<GpsAndPermissionEvent>(
      (event, emit) => emit(state.copyWith(
          isGpsEnabled: event.isGpsEnabled,
          isGpsPermissionGranted: event.isPermissionGranted)),
    );

    _init();
  }

  Future<void> _init() async {
    final isEnabled = await _checkGpsStatus();

    add(GpsAndPermissionEvent(
      isGpsEnabled: isEnabled,
      isPermissionGranted: state.isGpsPermissionGranted,
    ));
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();
    gpsStatusSubscription =
        Geolocator.getServiceStatusStream().listen((status) {
      final isEnabled = (status.index == 1) ? true : false;
      add(GpsAndPermissionEvent(
        isGpsEnabled: isEnabled,
        isPermissionGranted: state.isGpsPermissionGranted,
      ));
    });
    return isEnable;
  }

  Future<void> askGpsAccess() async {
    final status = Permission.location.request();

    switch (status) {
      case PermissionStatus.granted:
        add(GpsAndPermissionEvent(
            isGpsEnabled: state.isGpsEnabled, isPermissionGranted: true));
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        add(GpsAndPermissionEvent(
            isGpsEnabled: state.isGpsEnabled, isPermissionGranted: false));
        openAppSettings();
    }
  }

  @override
  Future<void> close() {
    gpsStatusSubscription?.cancel();
    return super.close();
  }
}
