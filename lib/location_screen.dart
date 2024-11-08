import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Add this import
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen(
      {super.key}); // Keep 'const' constructor for LocationScreen

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    _requestLocationPermission(); // Request location permission when the screen initializes
  }

  // Request location permission
  Future<void> _requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      // ignore: avoid_print
      print('Location permission granted');
    } else if (status.isDenied) {
      // ignore: avoid_print
      print('Location permission denied');
    } else if (status.isPermanentlyDenied) {
      // ignore: avoid_print
      print('Location permission permanently denied');
      openAppSettings(); // Optionally open app settings
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Map")),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Example starting point
          zoom: 12,
        ),
        onMapCreated: (controller) {
          // Handle map creation here
        },
      ),
    );
  }
}
