import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMapScreen extends StatefulWidget {
  @override
  _LocationMapScreenState createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  final List<LatLng> _polylineCoordinates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location Map")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Example starting point
          zoom: 12,
        ),
        markers: _markers,
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: _polylineCoordinates,
            color: Colors.blue,
            width: 4,
          ),
        },
        onMapCreated: (controller) {
          _controller = controller;
          _loadMapData();
        },
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Text("Route Details: Start, Stop, Total KMs, Duration"),
      ),
    );
  }

  void _loadMapData() {
    // Mock data for demonstration; replace with real location data
    setState(() {
      _markers.add(Marker(markerId: MarkerId("start"), position: LatLng(37.7749, -122.4194)));
      _polylineCoordinates.addAll([
        LatLng(37.7749, -122.4194),
        LatLng(37.7849, -122.4294),
        LatLng(37.7949, -122.4394),
      ]);
    });
  }
}