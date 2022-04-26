import 'package:albetro/app/core/p.dart';
import 'package:albetro/app/global_widgets/space.dart';
import 'package:albetro/app/module/dashboard_module/componects/booking_card.dart';
import 'package:albetro/app/module/dashboard_module/componects/class.dart';
import 'package:albetro/app/global_widgets/info_card.dart';
import 'package:albetro/app/module/dashboard_module/componects/select_city.dart';
import 'package:albetro/app/module/dashboard_module/componects/travllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import '../../../routes/pages.dart';
import '../../core/theme/color_theme.dart';
import '../../global_widgets/button.dart';
import 'controller.dart';

class BookScreen extends StatefulWidget {
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    Image.asset(
                      'assets/images/profile.png',
                      height: 32,
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    Text(
                      'Hi Segun',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: textColor),
                    ),
                    Text(
                      'Where are you flying to?',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: textColor),
                    ),
                    Space.Y(24),
                    BoolingCard(),
                    Space.Y(24),
                    P.dashboard.flyingTo != null &&
                            P.dashboard.flyingFrom != null
                        ? Press.bold(
                            'Search Flight',
                            onPressed: () {
                              P.dashboard.filghtInfo();
                            },
                          )
                        : Press.bold(
                            'Search Flight',
                          ),
                    Space.Y(24),
                    InfoCard(
                      'Check COVID-19 airline measures before you go',
                      color: Primary,
                    ),
                    Space.Y(20),
                    InfoCard(
                      'India to US flight bookings open! Check all the countries open for travel',
                      color: Teal,
                    ),
                    Space.Y(20),
                    Text(
                      'Discover more',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: textColor.withOpacity(0.3)),
                    ),
                    Space.Y(20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InfoCard(
                            'India to US flight bookings open! Check all the countries open for travel',
                            color: Green,
                            subTitle: '*T&C applied',
                            discount: 'ALB30',
                            textStyle: 14,
                            width: 200,
                          ),
                          Space.X(20),
                          InfoCard(
                            'Delhi terminal changes for some international flights',
                            color: Purple,
                            subTitle: ' ',
                            discount: ' ',
                            textStyle: 14,
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                    Space.Y(20),
                    InfoCard(
                      'Web check-in is government mendate now',
                      color: Red,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
                visible: P.dashboard.show == Show.SELECT_CITY,
                child: SelectCity()),
            Visibility(
                visible: P.dashboard.show == Show.TRAVELLER,
                child: Traveller()),
            Visibility(
                visible: P.dashboard.show == Show.FLIGHT_CLASS, child: Class())
          ],
        ),
      ),
    );
  }
}
