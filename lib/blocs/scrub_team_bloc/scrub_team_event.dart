import 'package:equatable/equatable.dart';

abstract class ScrubTeamEvent extends Equatable {
  const ScrubTeamEvent();

  @override
  List<Object> get props => [];
}

class UpdateTaskType extends ScrubTeamEvent {
  final String taskType;

  const UpdateTaskType(this.taskType);

  @override
  List<Object> get props => [taskType];
}

class UpdateExpenseType extends ScrubTeamEvent {
  final String expenseType;

  const UpdateExpenseType(this.expenseType);

  @override
  List<Object> get props => [expenseType];
}

class UpdateTransportMode extends ScrubTeamEvent {
  final String transportMode;

  const UpdateTransportMode(this.transportMode);

  @override
  List<Object> get props => [transportMode];
}

class UpdateFromLocation extends ScrubTeamEvent {
  final String fromLocation;

  const UpdateFromLocation(this.fromLocation);

  @override
  List<Object> get props => [fromLocation];
}

class UpdateToLocation extends ScrubTeamEvent {
  final String toLocation;

  const UpdateToLocation(this.toLocation);

  @override
  List<Object> get props => [toLocation];
}

class UpdateTravelAmount extends ScrubTeamEvent {
  final String travelAmount;

  const UpdateTravelAmount(this.travelAmount);

  @override
  List<Object> get props => [travelAmount];
}

class UpdateFoodAmount extends ScrubTeamEvent {
  final String foodAmount;

  const UpdateFoodAmount(this.foodAmount);

  @override
  List<Object> get props => [foodAmount];
}

class UpdateSurgery extends ScrubTeamEvent {
  final String surgery;

  const UpdateSurgery(this.surgery);

  @override
  List<Object> get props => [surgery];
}

class UpdateSurgeonName extends ScrubTeamEvent {
  final String surgeonName;

  const UpdateSurgeonName(this.surgeonName);

  @override
  List<Object> get props => [surgeonName];
}
