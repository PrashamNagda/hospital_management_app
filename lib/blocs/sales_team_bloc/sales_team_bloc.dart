import 'package:flutter_bloc/flutter_bloc.dart';
import 'sales_team_event.dart';
import 'sales_team_state.dart';

class SalesTeamBloc extends Bloc<SalesTeamEvent, SalesTeamState> {
  SalesTeamBloc() : super(SalesTeamInitial());

  @override
  Stream<SalesTeamState> mapEventToState(SalesTeamEvent event) async* {
    if (event is HospitalNameChanged) {
      yield state.copyWith(hospitalName: event.hospitalName);
    } else if (event is SurgeonNameChanged) {
      yield state.copyWith(surgeonName: event.surgeonName);
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
