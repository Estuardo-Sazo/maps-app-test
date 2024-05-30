part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitilized;
  final bool isFollowingUser;

  const MapState({
    this.isMapInitilized = false,
    this.isFollowingUser = true,
  });

  MapState copyWith({
    bool? isMapInitilized,
    bool? isFollowingUser,
  }) =>
      MapState(
        isMapInitilized: isMapInitilized ?? this.isMapInitilized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
      );

  @override
  List<Object> get props => [isMapInitilized, isFollowingUser];
}
