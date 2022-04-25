import 'package:albetro/app/global_widgets/space.dart';
import 'package:albetro/routes/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/color_theme.dart';

class FLightCard extends StatelessWidget {
  String location;
  String flight_type;
  String time;
  String total_time;
  String price;
  String airline;

  FLightCard(this.location, this.flight_type, this.time, this.total_time,
      this.price, this.airline,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: (){
          Get.toNamed( Routes.FLIGHTDETAILS);
        },
        child: Container(

            height: 144,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: textColor.withOpacity(0.3)),
                      ),
                      Spacer(),
                      Text(
                        flight_type,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Primary),
                      ),
                    ],
                  ),
                  Space.Y(15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            time,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: textColor),
                          ),
                          Space.Y(10),
                          Text(
                            total_time,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: textColor),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: textColor),
                      ),
                    ],
                  ),
                  Space.Y(15),
                  Row(

                    children: [
                      Image.asset('assets/images/logo.png', height: 24,),
                    Space.X(20),
                      Text(
                        airline,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
