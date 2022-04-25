import 'package:albetro/app/core/theme/color_theme.dart';
import 'package:albetro/app/global_widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class InfoCard extends StatelessWidget {
  double? textStyle;
  String title;
  Color? color;
  double ? width;

  InfoCard(this.title,
      {Key? key, this.textStyle, this.color, this.width, this.discount, this.subTitle})
      : super(key: key);

  String? discount;
  String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
     width: width??double.infinity,
     // width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Surface,
                fontSize: textStyle?? 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            discount != null
                ? Text(
                    'Discount code: ' + discount!,
                    style: TextStyle(
                      color: Surface,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Container(),
            subTitle != null
                ? Text(
                    subTitle!,
                    style: TextStyle(
                      color: Surface.withOpacity(0.5),
                      fontSize: textStyle,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Container(),
            Space.Y(10),
            SvgPicture.asset('assets/svg/arrow.svg',
                color: Surface.withOpacity(0.5),
                semanticsLabel: 'A red up arrow'),
          ],
        ),
      ),
    );
  }
}
