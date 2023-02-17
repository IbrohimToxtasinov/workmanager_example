import 'package:workmanager_example/data/local_databse/local_database.dart';
import 'package:workmanager_example/data/models/location/location_model.dart';

class LocationDbRepository {
  Future<int> deleteAllContacts() => LocalDatabase.deleteAll();

  Future<int> deleteLocationById({required int id}) {
    return LocalDatabase.deleteLocationById(
      id: id,
    );
  }

  Future<LocationModel> addLocation({required LocationModel locationModel}) =>
      LocalDatabase.insertToDatabase(locationModel: locationModel);

  Future<List<LocationModel>> getAllContacts() => LocalDatabase.getList();

  Future<LocationModel> updateContacts(
          {required LocationModel locationModel}) =>
      LocalDatabase.updateTaskById(updatedContact: locationModel);
}
