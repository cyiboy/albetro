import 'package:albetro/app/core/p.dart';
import 'package:albetro/app/core/theme/color_theme.dart';
import 'package:albetro/app/data/models/flight_details_model.dart';
import 'package:albetro/app/global_widgets/info_card.dart';
import 'package:albetro/app/global_widgets/space.dart';
import 'package:albetro/app/module/flight_module/componects/filght_card.dart';
import 'package:albetro/app/module/flight_module/componects/search_flight_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FlightSearch extends StatefulWidget {
  @override
  State<FlightSearch> createState() => _FlightSearchState();
}

class _FlightSearchState extends State<FlightSearch> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    P.flight.getFlight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Surface,
      appBar: FlightAppBar(title: '',),
      body: SingleChildScrollView(
        child: Obx(
      () => Container(
          child: Column(
            children: [
              Divider(
                thickness: 1,
                color: textColor.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: P.flight.loading.value?Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/loading_logo.png',width: 150, height: 300,),
                    Space.Y(50),
                    Text(
                      ' Keep your seatbelt fastened!',

                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: textColor),
                    ),
                    Space.Y(10),
                    Text(
                      'Looking for best flights',

                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: textColor.withOpacity(0.3)),
                    ),

                  ],
                ):
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoCard('Check COVID-19 airline measures before you go', color: Primary,),
                    Space.Y(30),
                    Text(
                      'Showing '+ P.flight.flight.length.toString()+' Direct Flights',

                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: textColor.withOpacity(0.3)),
                    ),
                    Space.Y(20),
                    //for( final i in flight)
                      P.flight.flight.isEmpty?
                   Container(
                     child: Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Image.asset('assets/images/loading_logo.png',width: 150, height: 300,),
                           Space.Y(50),
                           Text(
                           ' No Available flight to Destination',

                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14,
                                 color: textColor),
                           ),

                         ],
                       ),
                     ),
                   ):
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: P.flight.airline!.obs.length,
                        itemBuilder: (context, index) {

                          return GestureDetector(
                              onTap: () async {
                              },
                              child:FLightCard(P.flight.airline![index]));
                        },
                      ),


                  ],
                ),
              )

            ],
          ),
        ),
      ),
    ));
  }
}
