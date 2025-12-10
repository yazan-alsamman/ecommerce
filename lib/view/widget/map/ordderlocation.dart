import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tataboq_app/controller/orders/details_controller.dart';
import 'package:tataboq_app/core/constant/imageasset.dart';

void main() {
  runApp(const OrderLocation());
}

class OrderLocation extends StatefulWidget {
  const OrderLocation({super.key});

  @override
  State<OrderLocation> createState() => _OrderLocationState();
}

class _OrderLocationState extends State<OrderLocation> {
  LatLng? currentLocation;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    currentLocation = LatLng(
        controller.ordersModel.adressLat!, controller.ordersModel.adressLong!);
    isLoading = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: isLoading
            ? Center(child: Text(AppImageAsset.loading))
            : FlutterMap(
                options: MapOptions(
                  initialCenter: currentLocation!,
                  initialZoom: 10,
                  interactionOptions: const InteractionOptions(
                      flags: ~InteractiveFlag.doubleTapZoom),
                ),
                children: [
                  openStreetMapTileLayer,
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
              ),
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
