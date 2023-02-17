import 'package:workmanager_example/data/models/location/location_model.dart';

abstract class LocationState {}

class InitialLocationState extends LocationState {}

class LoadLocationProgress extends LocationState {}

class LoadLocationSuccess extends LocationState {
  LoadLocationSuccess({required this.locations});

  final List<LocationModel> locations;
}

class LoadLocationFailure extends LocationState {}