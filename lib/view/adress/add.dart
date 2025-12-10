import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/core/constant/routes.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  List<Marker> markers = [];
  LatLng? currentLocation;
  bool isLoading = true;
  LatLng? savedLatLng;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          isLoading = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
      isLoading = false;
    });
  }

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
      savedLatLng = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : FlutterMap(
            options: MapOptions(
              initialCenter: currentLocation ?? const LatLng(33.5138, 36.2765),
              initialZoom: 15,
              interactionOptions: const InteractionOptions(
                  flags: ~InteractiveFlag.doubleTapZoom),
              onTap: _onMapTap,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(markers: markers),
              if (currentLocation != null)
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
          );
  }
}

class AdressAdd extends StatelessWidget {
  const AdressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final mapWidgetState = GlobalKey<_MapWidgetState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding new Address'),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        onPressed: () {
          final savedLatLng = mapWidgetState.currentState?.savedLatLng;
          if (savedLatLng != null) {
            Get.toNamed(AppRoute.adressaddtwo, arguments: {
              "lat": savedLatLng.latitude.toString(),
              "long": savedLatLng.longitude.toString(),
            });
          } else {
            Get.snackbar('Error', 'Please select a location on the map');
          }
        },
        child: const Icon(Icons.add),
      ),
      body: MapWidget(key: mapWidgetState),
    );
  }
}