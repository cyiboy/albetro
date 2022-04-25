import 'package:flutter/cupertino.dart';

import '../../../core/theme/color_theme.dart';
import '../../../global_widgets/space.dart';

class AirportItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New York',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: textColor),
              ),
              Space.Y(5),
              Text(
                'John F Kenndy',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: textColor.withOpacity(0.5)),
              ),
            ],
          ),
          Spacer(),
          Text(
            'JFK',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Primary),
          ),
        ],
      ),
    );
  }
}
