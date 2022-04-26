import 'package:albetro/app/core/p.dart';
import 'package:albetro/app/global_widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/color_theme.dart';


class FlightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlightAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Surface,
      centerTitle: true,
      title: Container(
        child: Column(

          children: [
            Row(
           
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  P.dashboard.flightModel!.from!.iata_code!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: textColor),
                ),
                Space.X(10),
                SvgPicture.asset('assets/svg/book.svg',
                    color: textColor.withOpacity(0.2),
                    semanticsLabel: 'A red up arrow'),
                Space.X(10),
                Text(
                    P.dashboard.flightModel!.to!.iata_code!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: textColor),
                ),
              ],
            ),
            Text(
              DateFormat('EEEE, d MMM').format(P.dashboard.flightModel!.date!)+

              ' . '+P.dashboard.flightModel!.adult.toString()+' Adult . '+P.dashboard.flightModel!.classs!,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: textColor.withOpacity(0.5)),
            ),
          ],
        ),
      ),
      leading: new IconButton(
        icon: new Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () {

          Get.back();
        },
      ),
      actions: [
        SvgPicture.asset('assets/svg/share.svg',
            color: textColor,
            semanticsLabel: 'A red up arrow'),
        Space.X(10)
      ],

      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
