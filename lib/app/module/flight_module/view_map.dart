import 'dart:async';

import 'package:albetro/app/global_widgets/custom_appbar.dart';
import 'package:albetro/app/module/flight_module/componects/search_flight_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_curved_line/maps_curved_line.dart';

import '../../core/p.dart';
import '../../core/theme/color_theme.dart';

class ViewMap extends StatefulWidget {
  @override
  State<ViewMap> createState() => _ViewMapState();
}

class _ViewMapState extends State<ViewMap> {
  String _mapStyle = '';

  void initState() {
    super.initState();

    rootBundle.loadString('assets/style/map_style.json').then((string) {
      _mapStyle = string;
    });
  }

  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  LatLng _point1 = LatLng(P.dashboard.flyingFrom!.lat!, P.dashboard.flyingFrom!.lng!);

  LatLng _point2 = LatLng(P.dashboard.flyingTo!.lat!, P.dashboard.flyingTo!.lng!);

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(P.dashboard.flyingFrom!.lat!, P.dashboard.flyingFrom!.lng!),

    zoom: 10.4746,
  );

  final Set<Polyline> _polylines = Set();

  @override
  Widget build(BuildContext context) {
    _polylines.add(
        Polyline(
          polylineId: PolylineId("line 1"),
          visible: true,
          width: 2,
          //latlng is List<LatLng>
          patterns: [PatternItem.dash(30), PatternItem.gap(10)],
          points: MapsCurvedLines.getPointsOnCurve(_point1, _point2), // Invoke lib to get curved line points
          color: Primary,
        )
    );
    return Scaffold(
      appBar: FlightAppBar(title: '',),
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          polylines: _polylines,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;

            mapController.setMapStyle(_mapStyle);
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
