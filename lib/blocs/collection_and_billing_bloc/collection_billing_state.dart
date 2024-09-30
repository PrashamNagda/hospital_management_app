import 'package:equatable/equatable.dart';

class CollectionBillingState extends Equatable {
  final String hospitalName;
  final String collectionMethod;
  final String chequePhoto;
  final String amountCollected;
  final String noteRemark;
  final String billingDetails;
  final String transportMode;
  final String fromLocation;
  final String toLocation;
  final String travelAmount;
  final String travelReceipt;
  final String foodAmount;
  final String foodReceipt;

  const CollectionBillingState({
    required this.hospitalName,
    required this.collectionMethod,
    required this.chequePhoto,
    required this.amountCollected,
    required this.noteRemark,
    required this.billingDetails,
    required this.transportMode,
    required this.fromLocation,
    required this.toLocation,
    required this.travelAmount,
    required this.travelReceipt,
    required this.foodAmount,
    required this.foodReceipt,
  });

  CollectionBillingState copyWith({
    String? hospitalName,
    String? collectionMethod,
    String? chequePhoto,
    String? amountCollected,
    String? noteRemark,
    String? billingDetails,
    String? transportMode,
    String? fromLocation,
    String? toLocation,
    String? travelAmount,
    String? travelReceipt,
    String? foodAmount,
    String? foodReceipt,
  }) {
    return CollectionBillingState(
      hospitalName: hospitalName ?? this.hospitalName,
      collectionMethod: collectionMethod ?? this.collectionMethod,
      chequePhoto: chequePhoto ?? this.chequePhoto,
      amountCollected: amountCollected ?? this.amountCollected,
      noteRemark: noteRemark ?? this.noteRemark,
      billingDetails: billingDetails ?? this.billingDetails,
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
        collectionMethod,
        chequePhoto,
        amountCollected,
        noteRemark,
        billingDetails,
        transportMode,
        fromLocation,
        toLocation,
        travelAmount,
        travelReceipt,
        foodAmount,
        foodReceipt,
      ];
}

class CollectionBillingInitial extends CollectionBillingState {
  const CollectionBillingInitial()
      : super(
          hospitalName: '',
          collectionMethod: '',
          chequePhoto: '',
          amountCollected: '',
          noteRemark: '',
          billingDetails: '',
          transportMode: '',
          fromLocation: '',
          toLocation: '',
          travelAmount: '',
          travelReceipt: '',
          foodAmount: '',
          foodReceipt: '',
        );
}
