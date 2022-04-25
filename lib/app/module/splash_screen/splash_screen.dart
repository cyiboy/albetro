import 'package:albetro/app/core/theme/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Surface,
      body:  Stack(
          children: [
            Center(
              child:  Container(
                child: Image.asset('assets/images/logo.png')
              ),
            ),
            Positioned(
                bottom: 20,
                left: 100,
                right: 100,

                child: Center(
                  child: Column(
              children:  [
                  Text(
                  'Albetro',
                  textAlign: TextAlign.center,

                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: textColor),
              ),
                Text(
                  'Fly right',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: textColor),
                )

              ],
            ),
                ))

          ],
        ),

    );
  }
}
