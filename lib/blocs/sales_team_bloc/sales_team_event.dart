import 'package:equatable/equatable.dart';

abstract class SalesTeamEvent extends Equatable {
  const SalesTeamEvent();

  @override
  List<Object> get props => [];
}

class HospitalNameChanged extends SalesTeamEvent {
  final String hospitalName;

  const HospitalNameChanged(this.hospitalName);

  @override
  List<Object> get props => [hospitalName];
}

class SurgeonNameChanged extends SalesTeamEvent {
  final String surgeonName;

  const SurgeonNameChanged(this.surgeonName);

  @override
  List<Object> get props => [surgeonName];
}

class TransportModeChanged extends SalesTeamEvent {
  final String transportMode;

  const TransportModeChanged(this.transportMode);

  @override
  List<Object> get props => [transportMode];
}

class TravelFromChanged extends SalesTeamEvent {
  final String fromLocation;

  const TravelFromChanged(this.fromLocation);

  @override
  List<Object> get props => [fromLocation];
}

class TravelToChanged extends SalesTeamEvent {
  final String toLocation;

  const TravelToChanged(this.toLocation);

  @override
  List<Object> get props => [toLocation];
}

class TravelAmountChanged extends SalesTeamEvent {
  final String travelAmount;

  const TravelAmountChanged(this.travelAmount);

  @override
  List<Object> get props => [travelAmount];
}

class TravelReceiptUploaded extends SalesTeamEvent {
  final String travelReceipt;

  const TravelReceiptUploaded(this.travelReceipt);

  @override
  List<Object> get props => [travelReceipt];
}

class FoodAmountChanged extends SalesTeamEvent {
  final String foodAmount;

  const FoodAmountChanged(this.foodAmount);

  @override
  List<Object> get props => [foodAmount];
}

class FoodReceiptUploaded extends SalesTeamEvent {
  final String foodReceipt;

  const FoodReceiptUploaded(this.foodReceipt);

  @override
  List<Object> get props => [foodReceipt];
}
