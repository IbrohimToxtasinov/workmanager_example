import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager_example/state_managers/cubit/get_location/get_notification_cubit.dart';
import 'package:workmanager_example/state_managers/cubit/get_location/get_notification_state.dart';
import 'package:workmanager_example/ui/location/widgets/location_item.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Screen"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LoadLocationProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadLocationSuccess) {
              return Column(
                children: [
                  ...List.generate(
                    state.locations.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LocationItem(
                          locationModel: state.locations[index],
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const SizedBox(height: 10),
                const Text(
                  'You don`t have an location',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
