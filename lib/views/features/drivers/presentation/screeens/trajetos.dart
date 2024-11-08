import 'package:e_mobi/pallete_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Trajetos extends StatelessWidget {
  const Trajetos({super.key});
  final _kGooglePlex = const CameraPosition(
      target: LatLng(-23.54693592897848, -46.68576382353099), zoom: 17.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Trajetos",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(0),
            ),
            child: GoogleMap(
              minMaxZoomPreference: const map.MinMaxZoomPreference(15, 16),
              zoomGesturesEnabled: true,
              compassEnabled: false,
              trafficEnabled: true,
              myLocationButtonEnabled: false,
              onCameraMove: (position) {},
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {},
            ),
          ),
        ],
      ),
    );
  }
}
