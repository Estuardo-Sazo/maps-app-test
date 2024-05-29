part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitilized;
  final bool followUser;

  const MapState({
    this.isMapInitilized = false,
    this.followUser = false,
  });

  MapState copyWith({
    bool? isMapInitilized,
    bool? followUser,
  }) =>
      MapState(
        isMapInitilized: isMapInitilized ?? this.isMapInitilized,
        followUser: followUser ?? this.followUser,
      );

  @override
  List<Object> get props => [isMapInitilized, followUser];
}
