import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../routes/pages.dart';
import '../../core/p.dart';
import '../../core/theme/color_theme.dart';
import '../../global_widgets/button.dart';
import '../../global_widgets/custom_appbar.dart';
import '../../global_widgets/input.dart';
import '../../global_widgets/space.dart';

class PayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Surface,
      appBar: CustomAppBar(
        title: 'Pay by Card',
      ),
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Input(type: InputType.number,
                    label: 'CARD NUMBER',
                    suffixIcon: IconButton(icon: ImageIcon(AssetImage('assets/images/master.png', ),color: Primary, size: 40,), onPressed: () {  },

                    ),
                  ),
                  Space.Y(10),
                  Input(type: InputType.text,
                    label: 'NAME ON CARD',

                  ),
                  Space.Y(10),
                  Row(
                    children: [


                      Expanded(
                        child: GestureDetector(
                          onTap: (){
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
                                onChanged: (date) {
                                  print('change $date');
                                }, onConfirm: (date) {
                                  P.flight.expiry_card.text = date.year.toString()+" : "+date.month.toString()+" : "+date.day.toString();

                                }, currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                          child: Input(
                            label: 'EXPIRY',
                            active: false,
                            type: InputType.date,
                            controller: P.flight.expiry_card,
                            validator: (v) => v!.isNotEmpty ? null : "Field is required ",

                          ),
                        ),
                      ),
                      Space.X(10),
                      Expanded(
                        child: Input(type: InputType.number,

                          label: 'CVV',

                        ),
                      ),
                    ],
                  ),
                  Space.Y(40),
                  Center(
                    child: Text(
                      '46 million+ satisfied customers have used Albetro',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color:textColor.withOpacity(0.3)),
                    ),
                  ),
                  Space.Y(10),
                  Center(child: Image.asset('assets/images/card_support.png'),)
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  color: cards,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOTAL FARE',
                              style: TextStyle(
                                color: textColor.withOpacity(0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              P.flight.airline![0].price!,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Space.X(40),
                        Expanded(
                            child: Press.bold(
                              'Continue',
                              onPressed: () {
                                Get.toNamed( Routes.PROCESSING);
                              },
                            )),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
