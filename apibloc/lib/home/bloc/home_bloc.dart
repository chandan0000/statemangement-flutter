import 'package:apibloc/services/boredServices.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final BoredService _boredService;

  HomeBloc(this._boredService) : super(HomeLoadingSt()) {
    on<LoadApiEvent>(
      (event, emit) async {
        final activity = await _boredService.getBoredActivity();
        emit(HomeLoadState(
            activityName: activity.activity,
            activityType: activity.type,
            participants: activity.participants));
      },
    );
  }
}
