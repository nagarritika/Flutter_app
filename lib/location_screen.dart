import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Add this import
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  // No 'const' here
  const LocationScreen({super.key}); // Add 'const' only if no mutable state

  @override
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
      print('Location permission granted');
    } else if (status.isDenied) {
      print('Location permission denied');
    } else if (status.isPermanentlyDenied) {
      print('Location permission permanently denied');
      openAppSettings(); // This opens the app settings page
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
          // You can handle map setup here
        },
      ),
    );
  }
}
