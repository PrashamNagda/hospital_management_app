import 'package:equatable/equatable.dart';

abstract class RunnerTeamState extends Equatable {
  const RunnerTeamState();

  @override
  List<Object?> get props => [];
}

class RunnerTeamInitial extends RunnerTeamState {}

class RunnerTeamData extends RunnerTeamState {
  final String hospitalName;
  final String transportMode;
  final String fromLocation;
  final String toLocation;
  final String travelAmount;
  final String foodAmount;
  final String photoOfItemsPath;
  final String photoOfChallanPath;

  const RunnerTeamData({
    required this.hospitalName,
    required this.transportMode,
    required this.fromLocation,
    required this.toLocation,
    required this.travelAmount,
    required this.foodAmount,
    required this.photoOfItemsPath,
    required this.photoOfChallanPath,
  });

  @override
  List<Object?> get props => [
    hospitalName,
    transportMode,
    fromLocation,
    toLocation,
    travelAmount,
    foodAmount,
    photoOfItemsPath,
    photoOfChallanPath,
  ];
}
