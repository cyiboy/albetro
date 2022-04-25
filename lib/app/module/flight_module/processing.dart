import 'package:albetro/app/core/p.dart';
import 'package:albetro/app/global_widgets/space.dart';
import 'package:albetro/app/global_widgets/trip_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../routes/pages.dart';
import '../../core/theme/color_theme.dart';

class Processing extends StatefulWidget {
  @override
  State<Processing> createState() => _ProcessingState();
}

class _ProcessingState extends State<Processing> {
  @override
  void initState() {
    // TODO: implement initState
    P.flight.delayedMove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Surface,
        body: Obx(
          () => Container(
            child: P.flight.loading.value
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/processing.png',
                          width: 100,
                        ),
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
                  )
                : Padding(
                    padding: const EdgeInsets.all(27.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Space.Y(40),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.toNamed( Routes.DASHBOARD);
                              },
                              child: SvgPicture.asset(
                                'assets/svg/close.svg',
                                color: textColor,
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              'assets/svg/share.svg',
                              color: textColor,
                            ),
                          ],
                        ),
                        Space.Y(40),
                        Image.asset(
                          'assets/images/successs.png',
                          height: 40,
                        ),
                        Space.Y(20),
                        Text(
                          'Ta-da! \n Booking confirmed',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Space.Y(100),
                         TripDetails()
                      ],
                    ),
                  ),
          ),
        ));
  }
}
