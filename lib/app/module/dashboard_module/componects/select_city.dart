import 'package:albetro/app/core/p.dart';
import 'package:albetro/app/global_widgets/input.dart';
import 'package:albetro/app/module/dashboard_module/componects/airport_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/color_theme.dart';
import '../../../global_widgets/space.dart';

class SelectCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,children: [
            Space.X(20),
              GestureDetector(
                onTap: (){
                  P.dashboard.closeWidgetShowed();
                },
                child: SvgPicture.asset(
                    'assets/svg/close.svg',
                    color: textColor,

                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FLYING FROM',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: textColor),
                  ),

                  // Text(
                  //   'Select City',
                  //   textAlign: TextAlign.center,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 14,
                  //       color: textColor),
                  // ),
                ],
              ),
              Spacer(),
              SvgPicture.asset(
                  'assets/svg/book.svg',
                  color: textColor.withOpacity(0.2),
                  semanticsLabel: 'A red up arrow'
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'FLYING TO',


                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: textColor.withOpacity(0.3)),
                  ),


                ],
              ),
              Spacer(),
            ],),
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
                    label: 'Search Arrival Airport/City',

                    prefixIcon: IconButton(icon: const Icon(Icons.search), onPressed: () {  },),
                  ),
                  Space.Y(30),
                  AirportItem(),
                  Space.Y(30),
                  AirportItem(),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
