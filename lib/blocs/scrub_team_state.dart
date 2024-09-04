import 'package:equatable/equatable.dart';

abstract class ScrubTeamState extends Equatable {
  const ScrubTeamState();

  @override
  List<Object> get props => [];
}

class ScrubTeamInitial extends ScrubTeamState {}

class TaskTypeUpdated extends ScrubTeamState {
  final String taskType;

  TaskTypeUpdated(this.taskType);

  @override
  List<Object> get props => [taskType];
}

// Add more states as needed
