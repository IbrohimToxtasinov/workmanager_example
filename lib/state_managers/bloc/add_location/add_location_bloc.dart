import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workmanager_example/data/models/location/location_model.dart';
import 'package:workmanager_example/data/repositories/location_db_repository.dart';
import 'package:workmanager_example/utils/locator.dart';

part 'add_location_event.dart';

part 'add_location_state.dart';

class NotificationBloc extends Bloc<AddLocationEvent, AddLocationState> {
  NotificationBloc()
      : super(const AddLocationState(
          status: AddLocationStatus.PURE,
          location: [],
          statusText: "",
        )) {
    on<AddLocation>(_addNotification);
  }

  _addNotification(AddLocation event, Emitter<AddLocationState> emit) async {
    emit(state.copyWith(status: AddLocationStatus.LOADING));
    var newNotification = await appLocator
        .get<LocationDbRepository>()
        .addLocation(locationModel: event.locationModel);
    if (newNotification.id != null) {
      emit(state.copyWith(status: AddLocationStatus.notificationAdded));
    }
  }
}
