import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';
import 'package:workmanager_example/data/models/location/location_model.dart';
import 'package:workmanager_example/data/repositories/location_db_repository.dart';
import 'package:workmanager_example/state_managers/cubit/get_location/get_notification_cubit.dart';
import 'package:workmanager_example/ui/splash/splash_screen.dart';

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await Future.delayed(const Duration(seconds: 2));
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await LocationDbRepository().addLocation(
      locationModel: LocationModel(
        lat: position.latitude.toString(),
        long: position.longitude.toString(),
        createdAt: DateTime.now().toString(),
      ),
    );
    print("Qoshildiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    debugPrint("Location added");

    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask("task-identifier", "simpleTask");
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (BuildContext context) => LocationCubit(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
