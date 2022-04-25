import 'package:albetro/app/global_widgets/space.dart';
import 'package:albetro/app/module/dashboard_module/componects/class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/p.dart';
import '../../../core/theme/color_theme.dart';

class ClassItem extends StatelessWidget {
  final String flightClass;

  ClassItem( this.flightClass, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        P.dashboard.flightClass.value = flightClass;
        P.dashboard.closeWidgetShowed();
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/seat.svg',
                  color: textColor,
                ),
                Space.X(20),
                Container(
                  child:Text(
                    flightClass,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: textColor),
                  ),
                ),
              ],
            ),
            // Divider(
            //   thickness: 1,
            //   color: textColor.withOpacity(0.2),
            // ),
          ],
        ),
      ),
    );
  }
}