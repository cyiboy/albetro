import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/p.dart';
import '../../../core/theme/color_theme.dart';
import '../../../global_widgets/space.dart';
import '../controller.dart';

class BoolingCard extends StatefulWidget {
  @override
  State<BoolingCard> createState() => _BoolingCardState();
}

class _BoolingCardState extends State<BoolingCard> with TickerProviderStateMixin {

  int? val = -1;
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 3, vsync: this);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            height: 335,
            child: Stack(children: <Widget>[
              Positioned(
                  top: 0,
                  left: 2,
                  right: 2,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: cards,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TabBar(
                              labelPadding: const EdgeInsets.only(
                                  left: 30, right: 20),
                              controller: _tabController,
                              labelColor: Primary,
                              unselectedLabelColor: Colors.grey,
                              isScrollable: true,
                              indicatorColor: cards,
                              tabs: [
                                Tab(text: "Oneway"),
                                Tab(text: "Round Trip"),
                                Tab(text: "Multi-city"),
                              ]),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  top: 52,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 285,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: cards,
                      border: Border.all(
                        color: Surface,
                        width: 4,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              P.dashboard.changeWidgetShowed(
                                  widget: Show.SELECT_CITY);
                            },
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor
                                              .withOpacity(0.3)),
                                    ),
                                    Space.Y(10),
                                    Text(
                                      'Select City',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                SvgPicture.asset('assets/svg/book.svg',
                                    color: textColor.withOpacity(0.2),
                                    semanticsLabel: 'A red up arrow'),
                                Spacer(),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'FROM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor
                                              .withOpacity(0.3)),
                                    ),
                                    Space.Y(10),
                                    Text(
                                      'Select City',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: textColor.withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20, bottom: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'TRAVEL DATE',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: textColor
                                                .withOpacity(0.3)),
                                      ),
                                      Space.Y(5),
                                      Text(
                                        DateFormat('EEEE, d MMM').format(P.dashboard.travelDate.value),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        theme: DatePickerTheme(
                                            headerColor: cards,
                                            backgroundColor: cards,
                                            itemStyle: const TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 18),
                                            doneStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            )),
                                        minTime: DateTime.now(),

                                        onChanged: (date) {
                                          print('change $date');
                                        }, onConfirm: (date) {
                                          P.dashboard.travelDate.value = date;

                                        },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.en);
                                  }),
                              Spacer(),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'RETURN',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color:
                                        textColor.withOpacity(0.3)),
                                  ),
                                  Space.Y(5),
                                  Text(
                                    'Select Date',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color:
                                        textColor.withOpacity(0.3)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: textColor.withOpacity(0.2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20, bottom: 10),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                GestureDetector(

                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'TRAVELLERS',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: textColor
                                                .withOpacity(0.3)),
                                      ),
                                      Space.Y(5),
                                      Text(
                                        P.dashboard.adult.value.toString() +' Adult',
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor),
                                      ),
                                    ],
                                  ),
                                  onTap: (){
                                    P.dashboard.changeWidgetShowed(
                                        widget: Show.TRAVELLER);
                                  },
                                ),
                                Spacer(),
                                VerticalDivider(
                                  color: textColor.withOpacity(0.2),
                                  thickness: 3,
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: (){
                                    P.dashboard.changeWidgetShowed(
                                        widget: Show.FLIGHT_CLASS);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'CLASS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: textColor
                                                .withOpacity(0.3)),
                                      ),
                                      Space.Y(5),
                                      Text(
                                        P.dashboard.flightClass.value,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor
                                               ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: textColor.withOpacity(0.2),
                        ),
                        ListTile(
                          title: Text(
                            "Show direct flight only",
                            style: TextStyle(color: textColor),
                          ),
                          leading: Radio(
                            value: 1,
                            fillColor: MaterialStateProperty.all<Color>(
                                Colors.white),
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value as int?;
                              });
                            },
                            activeColor: textColor,
                          ),
                        ),
                      ],
                    ),
                  )),
            ]))
      ],
    );
  }
}
