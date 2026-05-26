import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  
  final Stream<Position> _locationStream = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    ),
  );

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
      ),
      body: StreamBuilder<Position>(
        stream: _locationStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            final Position position = snapshot.data!;
            final LatLng currentLatLng = LatLng(position.latitude, position.longitude);

            _mapController?.animateCamera(
              CameraUpdate.newLatLng(currentLatLng),
            );

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLatLng,
                zoom: 16.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: {
                Marker(
                  markerId: const MarkerId('current_location'),
                  position: currentLatLng,
                  infoWindow: InfoWindow(
                    title: 'Você está aqui',
                    snippet: 'Lat: ${position.latitude.toStringAsFixed(5)} | Lon: ${position.longitude.toStringAsFixed(5)}',
                  ),
                ),
              },
            );
          }

          return const Center(
            child: Text('Não foi possível obter a localização.'),
          );
        },
      ),
    );
  }
}