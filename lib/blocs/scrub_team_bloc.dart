import 'package:flutter_bloc/flutter_bloc.dart';
import 'scrub_team_event.dart';
import 'scrub_team_state.dart';

class ScrubTeamBloc extends Bloc<ScrubTeamEvent, ScrubTeamState> {
  ScrubTeamBloc() : super(ScrubTeamInitial());

  @override
  Stream<ScrubTeamState> mapEventToState(ScrubTeamEvent event) async* {
    if (event is UpdateTaskType) {
      yield TaskTypeUpdated(event.taskType);
    }
    // Handle other events
  }
}
