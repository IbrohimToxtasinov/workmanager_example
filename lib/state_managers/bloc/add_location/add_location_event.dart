part of 'add_location_bloc.dart';

abstract class AddLocationEvent {}

class AddLocation extends AddLocationEvent {
  AddLocation({required this.locationModel});

  final LocationModel locationModel;
}
