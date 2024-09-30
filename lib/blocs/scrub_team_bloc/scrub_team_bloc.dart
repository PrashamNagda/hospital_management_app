import 'package:flutter_bloc/flutter_bloc.dart';
import 'scrub_team_event.dart';
import 'scrub_team_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScrubTeamBloc extends Bloc<ScrubTeamEvent, ScrubTeamState> {
  ScrubTeamBloc()
      : super(const ScrubTeamState(
          taskType: '',
          expenseType: '',
          transportMode: '',
          fromLocation: '',
          toLocation: '',
          travelAmount: '',
          foodAmount: '',
          surgery: '',
          surgeonName: '',
        )) {
    on<UpdateTaskType>((event, emit) async {
      await _saveData('selectedTaskType', event.taskType);
      emit(state.copyWith(taskType: event.taskType));
    });

    on<UpdateExpenseType>((event, emit) async {
      await _saveData('selectedExpenseType', event.expenseType);
      emit(state.copyWith(expenseType: event.expenseType));
    });

    on<UpdateTransportMode>((event, emit) async {
      await _saveData('selectedTransportMode', event.transportMode);
      emit(state.copyWith(transportMode: event.transportMode));
    });

    on<UpdateFromLocation>((event, emit) async {
      await _saveData('fromLocation', event.fromLocation);
      emit(state.copyWith(fromLocation: event.fromLocation));
    });

    on<UpdateToLocation>((event, emit) async {
      await _saveData('toLocation', event.toLocation);
      emit(state.copyWith(toLocation: event.toLocation));
    });

    on<UpdateTravelAmount>((event, emit) async {
      await _saveData('travelAmount', event.travelAmount);
      emit(state.copyWith(travelAmount: event.travelAmount));
    });

    on<UpdateFoodAmount>((event, emit) async {
      await _saveData('foodAmount', event.foodAmount);
      emit(state.copyWith(foodAmount: event.foodAmount));
    });

    on<UpdateSurgery>((event, emit) async {
      await _saveData('selectedSurgery', event.surgery);
      emit(state.copyWith(surgery: event.surgery));
    });

    on<UpdateSurgeonName>((event, emit) async {
      await _saveData('surgeonName', event.surgeonName);
      emit(state.copyWith(surgeonName: event.surgeonName));
    });
  }

  Future<void> _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
