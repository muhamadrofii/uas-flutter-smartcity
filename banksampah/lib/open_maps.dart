import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OpenMaps extends StatefulWidget {
  final double latitude;
  final double longitude;

  const OpenMaps({super.key, required this.latitude, required this.longitude});

  @override
  State<OpenMaps> createState() => _OpenMapsState();
}

class _OpenMapsState extends State<OpenMaps> {
  late double _latitude;
  late double _longitude;

  @override

  @override
  void initState() {
    super.initState();
    _latitude = widget.latitude;
    _longitude = widget.longitude;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPS"),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(_latitude, _longitude),
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app',
    ),
    MarkerLayer(
      markers: [
        Marker(point: LatLng(_latitude, _longitude), child: const Icon(Icons.location_on, color: Colors.red,size: 30,))
      ],
    ),
            ],
          )
        ],
      ),
    );
  }
}
