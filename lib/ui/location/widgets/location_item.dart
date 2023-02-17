import 'package:flutter/material.dart';
import 'package:workmanager_example/data/models/location/location_model.dart';

class LocationItem extends StatelessWidget {
  final LocationModel locationModel;

  const LocationItem({
    super.key,
    required this.locationModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 110,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(6, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Lat: ${locationModel.lat.toString()}"),
          const SizedBox(height: 8),
          Text("Long: ${locationModel.long.toString()}"),
          Text("Created At: ${locationModel.createdAt}"),
        ],
      ),
    );
  }
}
