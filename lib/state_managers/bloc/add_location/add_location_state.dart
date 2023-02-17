part of 'add_location_bloc.dart';

class AddLocationState extends Equatable {
  final AddLocationStatus status;
  final String statusText;
  final List<LocationModel> location;

  const AddLocationState({
    required this.status,
    required this.statusText,
    required this.location,
  });

  AddLocationState copyWith({
    AddLocationStatus? status,
    List<LocationModel>? location,
    String? statusText,
  }) =>
      AddLocationState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        location: location ?? this.location,
      );

  @override
  List<Object?> get props => [
    status,
    statusText,
    location,
  ];
}

enum AddLocationStatus {
  LOADING,
  PURE,
  notificationAdded,
  notificationUpdated,
  notificationDeleted,
}