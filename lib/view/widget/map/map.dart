import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyAppMap());
}

class MyAppMap extends StatefulWidget {
  const MyAppMap({super.key});

  @override
  State<MyAppMap> createState() => _MyAppMapState();
}

class _MyAppMapState extends State<MyAppMap> {
  List<Marker> markers = []; // List to store markers
  LatLng? currentLocation;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle the case where location services are not enabled
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Check location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle the case where permissions are denied
        setState(() {
          isLoading = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle the case where permissions are permanently denied
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Fetch the current location
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      isLoading = false;
    });
  }

  // Function to handle map tap and add a marker
  void _onMapTap(TapPosition tapPosition, LatLng latLng) {
  setState(() {
    markers.clear();
    markers.add(
      Marker(
        point: latLng,
        width: 40,
        height: 40,
        child: const Icon(
          Icons.location_pin,
          color: Colors.blue,
          size: 40,
        ),
      ),
    );
    // Save the latitude and longitude
    _savedLatLng = latLng;
  });
}

LatLng? _savedLatLng; // Variable to store the tapped position

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : FlutterMap(
                options: MapOptions(
                  initialCenter: currentLocation ??
                      const LatLng(33.5138, 36.2765), // Fallback to Damascus
                  initialZoom: 15,
                  interactionOptions: const InteractionOptions(
                      flags: ~InteractiveFlag.doubleTapZoom),
                  onTap: _onMapTap, // Listen for tap events on the map
                ),
                children: [
                  openStreetMapTileLayer,
                  MarkerLayer(markers: markers), // Display all markers
                  if (currentLocation != null) // Show current location marker
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: currentLocation!,
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
