import 'package:albetro/app/core/p.dart';
import 'package:albetro/app/global_widgets/input.dart';
import 'package:albetro/app/module/dashboard_module/componects/airport_item.dart';
import 'package:albetro/app/module/dashboard_module/componects/traveller_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/color_theme.dart';
import '../../../global_widgets/space.dart';

class Traveller extends StatelessWidget {
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
              Space.Y(20)
,            Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Space.X(20),
                  GestureDetector(
                    onTap: () {
                      P.dashboard.closeWidgetShowed();
                    },
                    child: SvgPicture.asset(
                      'assets/svg/close.svg',
                      color: textColor,
                    ),
                  ),
                  Space.X(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No of Travellers',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
              Space.Y(10),
              Divider(
                thickness: 1,
                color: textColor.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [for (int i = 0; i < 6; i++) TravllerItem(i)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
