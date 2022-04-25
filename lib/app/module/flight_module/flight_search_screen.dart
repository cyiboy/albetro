import 'package:albetro/app/core/theme/color_theme.dart';
import 'package:albetro/app/global_widgets/info_card.dart';
import 'package:albetro/app/global_widgets/space.dart';
import 'package:albetro/app/module/flight_module/componects/filght_card.dart';
import 'package:albetro/app/module/flight_module/componects/search_flight_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlightSearch extends StatelessWidget {
  List flight = [{
  'location' : 'DEL -JFK',
 'flight_type': ' FASTEST',
  'time':'23:45 - 4:30',
   'total_time': '15h 15m • Direct',
  'price':'14,168',
   'airline': 'United Airlines UA 802'
  },
    {
      'location' : 'DEL - EWR',
      'flight_type': 'CHEAPEST',
      'time':'23:45 - 4:30',
      'total_time': '15h 15m • Direct',
      'price':'₹ 50,760',
      'airline': 'Air India AI 101'
    },
    {
      'location' : 'DEL -JFK',
      'flight_type': ' FASTEST',
      'time':'23:45 - 4:30',
      'total_time': '15h 15m • Direct',
      'price':'14,168',
      'airline': 'United Airlines UA 802'
    },
    {
      'location' : 'DEL - EWR',
      'flight_type': 'CHEAPEST',
      'time':'23:45 - 4:30',
      'total_time': '15h 15m • Direct',
      'price':'₹ 50,760',
      'airline': 'Air India AI 101'
    },
    {
      'location' : 'DEL -JFK',
      'flight_type': ' FASTEST',
      'time':'23:45 - 4:30',
      'total_time': '15h 15m • Direct',
      'price':'14,168',
      'airline': 'United Airlines UA 802'
    },

    {
      'location' : 'DEL - EWR',
      'flight_type': 'CHEAPEST',
      'time':'23:45 - 4:30',
      'total_time': '15h 15m • Direct',
      'price':'₹ 50,760',
      'airline': 'Air India AI 101'
    },
    {
      'location' : 'DEL -JFK',
      'flight_type': ' FASTEST',
      'time':'23:45 - 4:30',
      'total_time': '15h 15m • Direct',
      'price':'14,168',
      'airline': 'United Airlines UA 802'
    },


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Surface,
      appBar: FlightAppBar(title: '',),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Divider(
                thickness: 1,
                color: textColor.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoCard('Check COVID-19 airline measures before you go', color: Primary,),
                    Space.Y(30),
                    Text(
                      'Showing 20 Direct Flights',

                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: textColor.withOpacity(0.3)),
                    ),
                    Space.Y(20),
                    for( final i in flight)
                    FLightCard(i['location'],
                        i['flight_type'],
                        i['time'],
                        i['total_time'],
                        i['price'],
                        i['airline'])

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
