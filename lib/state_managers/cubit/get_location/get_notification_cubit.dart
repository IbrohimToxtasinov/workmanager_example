import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager_example/data/local_databse/local_database.dart';
import 'package:workmanager_example/state_managers/cubit/get_location/get_notification_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(InitialLocationState()) {
    getAllNotifications();
  }

  getAllNotifications() async {
    emit(LoadLocationProgress());
    var locations = await LocalDatabase.getList();
    emit(LoadLocationSuccess(locations: locations));
  }
}
