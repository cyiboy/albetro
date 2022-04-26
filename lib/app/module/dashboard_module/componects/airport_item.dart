import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/color_theme.dart';
import '../../../global_widgets/space.dart';

class AirportItem extends StatelessWidget {
  String city;
  String airportName;

  AirportItem(this.city, this.airportName, this.code);

  String code;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Container(

        child: Row(
          children: [
            SvgPicture.asset('assets/svg/book.svg',
                color: textColor.withOpacity(0.2),
                semanticsLabel: 'A red up arrow'),
            Space.X(15),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,

                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: textColor),
                  ),
                  Space.Y(5),
                  Text(
                    airportName,

                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: textColor.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              code,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14, color: Primary),
            ),
          ],
        ),
      ),
    );
  }
}
