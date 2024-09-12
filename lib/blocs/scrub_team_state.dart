import 'package:equatable/equatable.dart';

class ScrubTeamState extends Equatable {
  final String taskType;
  final String expenseType;
  final String transportMode;
  final String fromLocation;
  final String toLocation;
  final String travelAmount;
  final String foodAmount;
  final String surgery;
  final String surgeonName;

  const ScrubTeamState({
    required this.taskType,
    required this.expenseType,
    required this.transportMode,
    required this.fromLocation,
    required this.toLocation,
    required this.travelAmount,
    required this.foodAmount,
    required this.surgery,
    required this.surgeonName,
  });

  ScrubTeamState copyWith({
    String? taskType,
    String? expenseType,
    String? transportMode,
    String? fromLocation,
    String? toLocation,
    String? travelAmount,
    String? foodAmount,
    String? surgery,
    String? surgeonName,
  }) {
    return ScrubTeamState(
      taskType: taskType ?? this.taskType,
      expenseType: expenseType ?? this.expenseType,
      transportMode: transportMode ?? this.transportMode,
      fromLocation: fromLocation ?? this.fromLocation,
      toLocation: toLocation ?? this.toLocation,
      travelAmount: travelAmount ?? this.travelAmount,
      foodAmount: foodAmount ?? this.foodAmount,
      surgery: surgery ?? this.surgery,
      surgeonName: surgeonName ?? this.surgeonName,
    );
  }

  @override
  List<Object> get props => [
        taskType,
        expenseType,
        transportMode,
        fromLocation,
        toLocation,
        travelAmount,
        foodAmount,
        surgery,
        surgeonName,
      ];
}
