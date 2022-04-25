import 'package:albetro/app/global_widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/theme/color_theme.dart';

class Processing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Surface,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/processing.png' , width: 100,),
              Space.Y(100),
              Text(
                'Processing your payment',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: textColor),
              ),
              Text(
                'Connecting to the bank server',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: textColor.withOpacity(0.3)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
