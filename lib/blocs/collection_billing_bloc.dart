import 'package:flutter_bloc/flutter_bloc.dart';
import 'collection_billing_event.dart';
import 'collection_billing_state.dart';

class CollectionBillingBloc
    extends Bloc<CollectionBillingEvent, CollectionBillingState> {
  CollectionBillingBloc() : super(const CollectionBillingInitial());

  @override
  Stream<CollectionBillingState> mapEventToState(
      CollectionBillingEvent event) async* {
    if (event is HospitalNameChanged) {
      yield state.copyWith(hospitalName: event.hospitalName);
    } else if (event is CollectionMethodChanged) {
      yield state.copyWith(collectionMethod: event.collectionMethod);
    } else if (event is ChequePhotoUploaded) {
      yield state.copyWith(chequePhoto: event.chequePhoto);
    } else if (event is AmountCollectedChanged) {
      yield state.copyWith(amountCollected: event.amountCollected);
    } else if (event is NoteRemarkChanged) {
      yield state.copyWith(noteRemark: event.noteRemark);
    } else if (event is BillingDetailsChanged) {
      yield state.copyWith(billingDetails: event.billingDetails);
    } else if (event is TransportModeChanged) {
      yield state.copyWith(transportMode: event.transportMode);
    } else if (event is TravelFromChanged) {
      yield state.copyWith(fromLocation: event.fromLocation);
    } else if (event is TravelToChanged) {
      yield state.copyWith(toLocation: event.toLocation);
    } else if (event is TravelAmountChanged) {
      yield state.copyWith(travelAmount: event.travelAmount);
    } else if (event is TravelReceiptUploaded) {
      yield state.copyWith(travelReceipt: event.travelReceipt);
    } else if (event is FoodAmountChanged) {
      yield state.copyWith(foodAmount: event.foodAmount);
    } else if (event is FoodReceiptUploaded) {
      yield state.copyWith(foodReceipt: event.foodReceipt);
    }
  }
}
