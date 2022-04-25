import 'package:albetro/app/core/p.dart';
import 'package:albetro/app/global_widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/color_theme.dart';

class TravllerItem extends StatelessWidget {
 final int number;

 TravllerItem( this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        P.dashboard.adult.value = number;
        P.dashboard.closeWidgetShowed();
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.people_rounded, color: textColor,),
                Space.X(20),
                Container(
                  child:Text(
                    number.toString()+' Adult',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: textColor),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
