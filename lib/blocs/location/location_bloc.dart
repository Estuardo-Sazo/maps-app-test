import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {});
  }


  Future getCurrentLocation() async {
   final position = await Geolocator.getCurrentPosition();
   print('Location: ${position.latitude}, ${position.longitude}');
   
  }

  void startFollowingUser() {
    positionStream = Geolocator.getPositionStream().listen((position) {
      print('Location: ${position.latitude}, ${position.longitude}');
    });
  }

  void stopFollowingUser() {
    positionStream?.cancel();
    print('stopFollowingUser called');
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
