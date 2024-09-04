import 'package:equatable/equatable.dart';

abstract class ScrubTeamEvent extends Equatable {
  const ScrubTeamEvent();
}

class UpdateTaskType extends ScrubTeamEvent {
  final String taskType;

  UpdateTaskType(this.taskType);

  @override
  List<Object> get props => [taskType];
}

// Add more events for other actions (e.g., uploading photos, entering expenses, etc.)
