import 'package:equatable/equatable.dart';

class SalesTeamState extends Equatable {
  final String hospitalName;
  final String surgeonName;
  final String transportMode;
  final String fromLocation;
  final String toLocation;
  final String travelAmount;
  final String travelReceipt;
  final String foodAmount;
  final String foodReceipt;

  const SalesTeamState({
    this.hospitalName = '',
    this.surgeonName = '',
    this.transportMode = '',
    this.fromLocation = '',
    this.toLocation = '',
    this.travelAmount = '',
    this.travelReceipt = '',
    this.foodAmount = '',
    this.foodReceipt = '',
  });

  SalesTeamState copyWith({
    String? hospitalName,
    String? surgeonName,
    String? transportMode,
    String? fromLocation,
    String? toLocation,
    String? travelAmount,
    String? travelReceipt,
    String? foodAmount,
    String? foodReceipt,
  }) {
    return SalesTeamState(
      hospitalName: hospitalName ?? this.hospitalName,
      surgeonName: surgeonName ?? this.surgeonName,
      transportMode: transportMode ?? this.transportMode,
      fromLocation: fromLocation ?? this.fromLocation,
      toLocation: toLocation ?? this.toLocation,
      travelAmount: travelAmount ?? this.travelAmount,
      travelReceipt: travelReceipt ?? this.travelReceipt,
      foodAmount: foodAmount ?? this.foodAmount,
      foodReceipt: foodReceipt ?? this.foodReceipt,
    );
  }

  @override
  List<Object> get props => [
        hospitalName,
        surgeonName,
        transportMode,
        fromLocation,
        toLocation,
        travelAmount,
        travelReceipt,
        foodAmount,
        foodReceipt,
      ];
}

class SalesTeamInitial extends SalesTeamState {}
