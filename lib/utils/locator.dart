import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:workmanager_example/data/repositories/location_db_repository.dart';

final appLocator = GetIt.instance;

Future<void> locatorSetUp() async {
  appLocator.registerLazySingleton(() => LocationDbRepository());
  appLocator.registerLazySingleton(() => Dio());
}