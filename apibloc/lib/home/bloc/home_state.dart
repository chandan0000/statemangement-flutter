part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeLoadingSt extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadState extends HomeState {
  final String activityName;
  final String activityType;
  final int participants;
  HomeLoadState({
    required this.activityName,
    required this.activityType,
    required this.participants,
  });

  @override
  List<Object?> get props => [activityName, activityType,participants];
}
