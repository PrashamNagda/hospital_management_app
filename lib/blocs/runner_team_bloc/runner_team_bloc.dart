import 'package:flutter_bloc/flutter_bloc.dart';
import 'runner_team_event.dart';
import 'runner_team_state.dart';

class RunnerTeamBloc extends Bloc<RunnerTeamEvent, RunnerTeamState> {
  RunnerTeamBloc() : super(RunnerTeamInitial());

  @override
  Stream<RunnerTeamState> mapEventToState(RunnerTeamEvent event) async* {
    if (event is HospitalNameChanged ||
        event is TransportModeChanged ||
        event is TravelFromChanged ||
        event is TravelToChanged ||
        event is TravelAmountChanged ||
        event is FoodAmountChanged ||
        event is PhotoOfItemsChanged ||
        event is PhotoOfChallanChanged) {
      yield RunnerTeamData(
        hospitalName: (event is HospitalNameChanged)
            ? event.hospitalName
            : (state as RunnerTeamData).hospitalName,
        transportMode: (event is TransportModeChanged)
            ? event.transportMode
            : (state as RunnerTeamData).transportMode,
        fromLocation: (event is TravelFromChanged)
            ? event.fromLocation
            : (state as RunnerTeamData).fromLocation,
        toLocation: (event is TravelToChanged)
            ? event.toLocation
            : (state as RunnerTeamData).toLocation,
        travelAmount: (event is TravelAmountChanged)
            ? event.travelAmount
            : (state as RunnerTeamData).travelAmount,
        foodAmount: (event is FoodAmountChanged)
            ? event.foodAmount
            : (state as RunnerTeamData).foodAmount,
        photoOfItemsPath: (event is PhotoOfItemsChanged)
            ? event.photoPath
            : (state as RunnerTeamData).photoOfItemsPath,
        photoOfChallanPath: (event is PhotoOfChallanChanged)
            ? event.photoPath
            : (state as RunnerTeamData).photoOfChallanPath,
      );
    }
  }
}
