part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitilized;
  final bool isFollowingUser;

  //Polylines
  final Map<String, Polyline> polylines;

  /*

  'mi_ruta': Polyline(
    polylineId: PolylineId('Mi_ruta'),
    points: [
      LatLng(37.784326, -122.402357),
      LatLng(37.786996, -122.407437),
      LatLng(37.794204, -122.408802),
      LatLng(37.794316, -122.408594),
    ],
    color: Colors.black87,
    width: 4,
    startCap: Cap.roundCap,
    endCap: Cap.roundCap,
  ),


  */

  const MapState(
      {this.isMapInitilized = false,
      this.isFollowingUser = true,
      Map<String, Polyline>? polylines})
      : polylines = polylines ?? const {};

  MapState copyWith({
    bool? isMapInitilized,
    bool? isFollowingUser,
    Map<String, Polyline>? polylines,
  }) =>
      MapState(
        isMapInitilized: isMapInitilized ?? this.isMapInitilized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        polylines: polylines ?? this.polylines,
      );

  @override
  List<Object> get props => [isMapInitilized, isFollowingUser, polylines];
}
 