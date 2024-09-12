import 'package:equatable/equatable.dart';

abstract class CollectionBillingEvent extends Equatable {
  const CollectionBillingEvent();

  @override
  List<Object> get props => [];
}

class HospitalNameChanged extends CollectionBillingEvent {
  final String hospitalName;

  const HospitalNameChanged(this.hospitalName);

  @override
  List<Object> get props => [hospitalName];
}

class CollectionMethodChanged extends CollectionBillingEvent {
  final String collectionMethod;

  const CollectionMethodChanged(this.collectionMethod);

  @override
  List<Object> get props => [collectionMethod];
}

class ChequePhotoUploaded extends CollectionBillingEvent {
  final String chequePhoto;

  const ChequePhotoUploaded(this.chequePhoto);

  @override
  List<Object> get props => [chequePhoto];
}

class AmountCollectedChanged extends CollectionBillingEvent {
  final String amountCollected;

  const AmountCollectedChanged(this.amountCollected);

  @override
  List<Object> get props => [amountCollected];
}

class NoteRemarkChanged extends CollectionBillingEvent {
  final String noteRemark;

  const NoteRemarkChanged(this.noteRemark);

  @override
  List<Object> get props => [noteRemark];
}

class BillingDetailsChanged extends CollectionBillingEvent {
  final String billingDetails;

  const BillingDetailsChanged(this.billingDetails);

  @override
  List<Object> get props => [billingDetails];
}

class TransportModeChanged extends CollectionBillingEvent {
  final String transportMode;

  const TransportModeChanged(this.transportMode);

  @override
  List<Object> get props => [transportMode];
}

class TravelFromChanged extends CollectionBillingEvent {
  final String fromLocation;

  const TravelFromChanged(this.fromLocation);

  @override
  List<Object> get props => [fromLocation];
}

class TravelToChanged extends CollectionBillingEvent {
  final String toLocation;

  const TravelToChanged(this.toLocation);

  @override
  List<Object> get props => [toLocation];
}

class TravelAmountChanged extends CollectionBillingEvent {
  final String travelAmount;

  const TravelAmountChanged(this.travelAmount);

  @override
  List<Object> get props => [travelAmount];
}

class TravelReceiptUploaded extends CollectionBillingEvent {
  final String travelReceipt;

  const TravelReceiptUploaded(this.travelReceipt);

  @override
  List<Object> get props => [travelReceipt];
}

class FoodAmountChanged extends CollectionBillingEvent {
  final String foodAmount;

  const FoodAmountChanged(this.foodAmount);

  @override
  List<Object> get props => [foodAmount];
}

class FoodReceiptUploaded extends CollectionBillingEvent {
  final String foodReceipt;

  const FoodReceiptUploaded(this.foodReceipt);

  @override
  List<Object> get props => [foodReceipt];
}
