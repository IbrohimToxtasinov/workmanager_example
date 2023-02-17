import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager_example/ui/location/location_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await Geolocator.requestPermission();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LocationScreen()));
              },
              icon: const Icon(Icons.refresh)),
        ],
        title: Text("Splash Screen"),
      ),
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
