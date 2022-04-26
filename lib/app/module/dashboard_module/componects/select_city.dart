import 'package:albetro/app/core/p.dart';
import 'package:albetro/app/data/models/airport_model.dart';
import 'package:albetro/app/global_widgets/input.dart';
import 'package:albetro/app/module/dashboard_module/componects/airport_item.dart';
import 'package:albetro/app/module/dashboard_module/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/theme/color_theme.dart';
import '../../../global_widgets/space.dart';

class SelectCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: cards,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Space.Y(20),
          Obx(
                () =>
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Space.X(20),
                  GestureDetector(
                    onTap: () {
                     P.dashboard.closeWidgetShowed();
                      print('i was clicked');
                    },
                    child: SvgPicture.asset(
                      'assets/svg/close.svg',
                      color: textColor,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      P.dashboard.changeWidgetAirport(widget: Airport.FROM);
                    print('i was clicked');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FLYING FROM',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: P.dashboard.airportState.value == Airport.FROM?textColor:textColor.withOpacity(0.3)),
                        ),
                        P.dashboard.flyingFrom != null?
                        Text(
                          P.dashboard.flyingFrom!.iata_code!,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Primary),
                        ):
                            Container()
                        ,

                      ],
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/svg/book.svg',
                      color: textColor.withOpacity(0.2),
                      semanticsLabel: 'A red up arrow'),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      P.dashboard.changeWidgetAirport(widget: Airport.TO);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FLYING TO',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: P.dashboard.airportState.value == Airport.TO?textColor:textColor.withOpacity(0.3)),
                        ),
                        P.dashboard.flyingTo != null?
                        Text(
                          P.dashboard.flyingTo!.iata_code!,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Primary),
                        ):
                        Container()
                        ,

                      ],
                    ),
                  ),
                  Spacer(),
                ],
             // )
        )),
              Space.Y(10),
              Divider(
                thickness: 1,
                color: textColor.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Input(
                      type: InputType.text,
                      controller: P.dashboard.city,
                      label: 'Search Arrival Airport/City',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          P.dashboard.getCity();
                        },
                      ),
                    ),
                    Space.Y(30),
                    Obx(
                      () => P.dashboard.loading.value
                          ? Center(
                              child: CircularProgressIndicator( color: Primary,),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: P.dashboard.airport.obs.length,
                              itemBuilder: (context, index) {
                                var i = P.dashboard.airport.obs;

                                return GestureDetector(
                                    onTap: () async {
                                      print('i was');
                                     P.dashboard.city.text = " ";
                                     P.dashboard.airport = [];
                                     if( P.dashboard.airportState.value == Airport.TO){P.dashboard.closeWidgetShowed();
                                      P.dashboard.flyingTo =
                                          AirportModel.fromJson(i[index]);
                                      }else
                                        {

                                        P.dashboard.changeWidgetAirport(widget: Airport.TO);
                                        P.dashboard.flyingFrom =
                                            AirportModel.fromJson(i[index]);
                                      };

                                    },
                                    child: AirportItem(i[index]['name'],
                                        i[index]['slug'], i[index]['iata_code']));
                              },
                            ),
                    )
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
