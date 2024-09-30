import 'package:equatable/equatable.dart';

abstract class RunnerTeamEvent extends Equatable {
  const RunnerTeamEvent();

  @override
  List<Object?> get props => [];
}

class HospitalNameChanged extends RunnerTeamEvent {
  final String hospitalName;

  const HospitalNameChanged(this.hospitalName);

  @override
  List<Object?> get props => [hospitalName];
}

class TransportModeChanged extends RunnerTeamEvent {
  final String transportMode;

  const TransportModeChanged(this.transportMode);

  @override
  List<Object?> get props => [transportMode];
}

class TravelFromChanged extends RunnerTeamEvent {
  final String fromLocation;

  const TravelFromChanged(this.fromLocation);

  @override
  List<Object?> get props => [fromLocation];
}

class TravelToChanged extends RunnerTeamEvent {
  final String toLocation;

  const TravelToChanged(this.toLocation);

  @override
  List<Object?> get props => [toLocation];
}

class TravelAmountChanged extends RunnerTeamEvent {
  final String travelAmount;

  const TravelAmountChanged(this.travelAmount);

  @override
  List<Object?> get props => [travelAmount];
}

class FoodAmountChanged extends RunnerTeamEvent {
  final String foodAmount;

  const FoodAmountChanged(this.foodAmount);

  @override
  List<Object?> get props => [foodAmount];
}

class PhotoOfItemsChanged extends RunnerTeamEvent {
  final String photoPath;

  const PhotoOfItemsChanged(this.photoPath);

  @override
  List<Object?> get props => [photoPath];
}

class PhotoOfChallanChanged extends RunnerTeamEvent {
  final String photoPath;

  const PhotoOfChallanChanged(this.photoPath);

  @override
  List<Object?> get props => [photoPath];
}
