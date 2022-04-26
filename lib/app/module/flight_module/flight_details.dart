import 'dart:async';

import 'package:albetro/app/core/theme/color_theme.dart';
import 'package:albetro/app/global_widgets/button.dart';
import 'package:albetro/app/global_widgets/custom_appbar.dart';
import 'package:albetro/app/global_widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_curved_line/maps_curved_line.dart';

import '../../../routes/pages.dart';
import '../../core/p.dart';
import 'componects/filght_card.dart';

class FlightDetails extends StatefulWidget {
  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
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
      backgroundColor: Surface,
      appBar: CustomAppBar(
        title: 'Flight Details',
      ),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/svg/flight_path.svg',
                                color: textColor,
                                semanticsLabel: 'A red up arrow'),
                          ],
                        ),
                        Space.X(10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                P.dashboard.flyingFrom!.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: textColor),
                              ),
                              Space.Y(5),
                              Text(
                                P.dashboard.flyingFrom!.slug?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: textColor.withOpacity(0.5)),
                              ),
                              Space.Y(10),
                              FLightCard( P.flight.airline![0]),
                              Space.Y(10),
                              Text(
                                P.dashboard.flyingTo!.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: textColor),
                              ),
                              Space.Y(5),
                              Text(
                                P.dashboard.flyingTo!.slug??'',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: textColor.withOpacity(0.5)),
                              ),




                            ],
                          ),
                        ),
                      ],
                    ),
                    Space.Y(20),
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: cards,
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
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
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: (){ Get.toNamed( Routes.MAPVIEW);},
                                child: Center(
                                  child:   Text(
                                    'View More',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Primary),
                                  ),
                                ),
                              )
                            ),
                          )
                        ],
                      )

                    ),
                    Space.Y(20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: cards,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What flight crew is doing to ensure your safety?',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24,
                                  color: textColor),
                            ),
                            Space.Y(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/tick.svg',
                                    color: Green,
                                ),
                                Space.X(10),
                                Text(
                                  'Flight crew wear PPE Kit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: textColor),
                                ),
                              ],
                            ),
                            Space.Y(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/tick.svg',
                                  color: Green,
                                ),
                                Space.X(10),
                                Text(
                                  'Flight crew wear PPE Kit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: textColor),
                                ),
                              ],
                            ),
                            Space.Y(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/tick.svg',
                                  color: Green,
                                ),
                                Space.X(10),
                                Text(
                                  'Flight crew wear PPE Kit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: textColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                    Space.Y(20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: cards,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 0, top: 10, bottom: 15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BAGGAGE POLICY',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: textColor.withOpacity(0.3)),
                                ),
                                Space.Y(5),
                                Text(
                                  'What all you can take?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: textColor),
                                ),
                                Space.Y(20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset('assets/svg/cabin bag.svg',
                                      color: Green,
                                    ),
                                    Space.X(10),
                                    Text(
                                      '1 Cabin bag 7Kg',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                                Space.Y(20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset('assets/svg/checkin bag.svg',
                                      color: Green,
                                    ),
                                    Space.X(10),
                                    Text(
                                      '2 Checking Bag 23Kg each',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                                Space.Y(20),
                                Text(
                                  'Have extra bags?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Primary),
                                ),
                              ],
                            ),
                            Spacer(),
                            Image.asset('assets/images/bags.png', width: 100, height: 100,)
                          ],
                        ),
                      ),

                    ),
                    Space.Y(20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: cards,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In flight experience',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 24,
                                  color: textColor),
                            ),
                            Space.Y(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/meal.svg',
                                  color: textColor.withOpacity(0.5),
                                ),
                                Space.X(10),
                                Text(
                                  'Free meal provided',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: textColor),
                                ),
                              ],
                            ),
                            Space.Y(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/entertainment.svg',
                                  color: textColor.withOpacity(0.5),
                                ),
                                Space.X(10),
                                Text(
                                  'Entertainment',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: textColor),
                                ),
                              ],
                            ),
                            Space.Y(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/USB.svg',
                                  color: textColor.withOpacity(0.5),
                                ),
                                Space.X(10),
                                Text(
                                  'Power and USB port',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: textColor),
                                ),
                              ],
                            ),
                            Space.Y(20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/seat.svg',
                                  color: textColor.withOpacity(0.5),
                                ),
                                Space.X(10),
                                Text(
                                  '3-3-3 seat layout',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: textColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                    Space.Y(100),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  color: cards,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOTAL FARE',
                              style: TextStyle(
                                color: textColor.withOpacity(0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              P.flight.airline![0].price!,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Space.X(40),
                        Expanded(
                            child: Press.bold(
                          'Continue',
                          onPressed: () {
                            Get.toNamed( Routes.TRAVELLERDETAILS);
                          },
                        )),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
