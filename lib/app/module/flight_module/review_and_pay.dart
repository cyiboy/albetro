import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/pages.dart';
import '../../core/theme/color_theme.dart';
import '../../global_widgets/button.dart';
import '../../global_widgets/custom_appbar.dart';
import '../../global_widgets/input.dart';
import '../../global_widgets/space.dart';

class ReviewPay extends StatefulWidget {
  @override
  State<ReviewPay> createState() => _ReviewPayState();
}

class _ReviewPayState extends State<ReviewPay> {
  String val = 'CARD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Surface,
      appBar: const CustomAppBar(
        title: 'Review and Pay',
      ),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: cards,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 15),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'FROM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                    Spacer(),
                                    SvgPicture.asset('assets/svg/book.svg',
                                      color: textColor.withOpacity(0.3),
                                    ),
                                    Spacer(),
                                    Text(
                                      'To',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                  ],
                                ),
                                Space.Y(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'DEL',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color:textColor),
                                    ),
                                    Spacer(),

                                    Text(
                                      'JFK',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color:textColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'New Delhi, india',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                    Spacer(),

                                    Text(
                                      'John F. Kennedy, NY',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '23:45, Thu 15 Oct',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                    Spacer(),

                                    Text(
                                      '4:30, Fri 16 Oct',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                  ],
                                ),
                                Space.Y(10),
                                Divider(
                                  thickness: 1,
                                  color: textColor.withOpacity(0.2),
                                ),
                                Space.Y(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/logo.png", height: 24,),
                                    Space.X(10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'United Airlines UA 802',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color:textColor),
                                        ),
                                        Text(
                                          '15h 15m • Direct',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              color:textColor.withOpacity(0.3)),
                                        ),
                                      ],
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
                            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TRAVELLER DETAILS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color:textColor.withOpacity(0.3)),
                                ),
                                Space.Y(15),
                                Text(
                                  'Victor Agbenro',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color:textColor),
                                ),
                                Text(
                                  'vagbenro@gmail.com',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      color:textColor ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                    Space.Y(35),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SvgPicture.asset('assets/svg/lock.svg',
                          color: textColor.withOpacity(0.3),
                        ),
                        Space.X(10),
                        Text(
                          'SELECT PAYMENT METHOD',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color:textColor.withOpacity(0.3)),
                        ),
                      ],
                    ),
                    Space.Y(10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: cards,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Image.asset('assets/images/card.png',height: 45 ,),
                            leading: Radio(
                              value: 'CARD',
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value.toString();
                                });
                              },
                              activeColor: textColor,
                            ),
                          ),
                          ListTile(
                            title: Text('UPI',style: TextStyle(color: textColor),),

                            leading: Radio(
                              value: 'UPI',
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value.toString();
                                });
                              },
                              activeColor: textColor,
                            ),
                          ),
                          ListTile(
                            title: Text('WALLET', style: TextStyle(color: textColor),),

                            leading: Radio(
                              value: 'WALLET',
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value.toString();
                                });
                              },
                              activeColor: textColor,
                            ),
                          ),
                          ListTile(
                            title: Text('Mobile Banking',style: TextStyle(color: textColor),),

                            leading: Radio(
                              value: 'Mobile',
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value.toString();
                                });
                              },
                              activeColor: textColor,
                            ),
                          ),

                        ],
                      ),

                    ),
                    Space.Y(10),
                    Input(type: InputType.email,
                      label: 'ENTER DISCOUNT CODE',
                      suffixIcon: IconButton(icon: ImageIcon(AssetImage('assets/images/Apply.png', ),color: Primary, size: 40,), onPressed: () {  },

                      ),
                    ),
                    Space.Y(35),
                    Text(
                      'FARE BREAKUP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color:textColor.withOpacity(0.3)),
                    ),
                    Space.Y(10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: cards,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 15),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Base Fare',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                    Spacer(),

                                    Text(
                                      '₹20,168',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color:textColor),
                                    ),
                                  ],
                                ),
                                Space.Y(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Fee & Surcharges',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                    Spacer(),

                                    Text(
                                      '₹20,168',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color:textColor),
                                    ),
                                  ],
                                ),
                                Space.Y(10),
                                Divider(
                                  thickness: 1,
                                  color: textColor.withOpacity(0.2),
                                ),
                                Space.Y(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Travel Insurance',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                    Spacer(),

                                    Text(
                                      '₹20,168',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color:textColor),
                                    ),
                                  ],
                                ),
                                Space.Y(10),
                                Divider(
                                  thickness: 1,
                                  color: textColor.withOpacity(0.2),
                                ),
                                Space.Y(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Convenience Fee',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color:textColor.withOpacity(0.3)),
                                    ),
                                    Spacer(),

                                    Text(
                                      '₹20,168',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color:textColor),
                                    ),
                                  ],
                                ),
                                Space.Y(10),
                                Divider(
                                  thickness: 1,
                                  color: textColor.withOpacity(0.2),
                                ),
                                Space.Y(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          color:textColor),
                                    ),
                                    Spacer(),

                                    Text(
                                      '₹20,168',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color:textColor),
                                    ),
                                  ],
                                ),
                                Space.Y(10),
                              ],
                            ),
                          ),

                        ],
                      ),

                    ),
                    Space.Y(40),
                    Text(
                      'By continuing to pay, you agree with our privacy policy and terms of service',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color:textColor),
                    ),
                    Space.Y(100),
                  ],
                ),
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
                              '₹ 50,760',
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
                              onPressed: () {         Get.toNamed( Routes.PAYCARD);},
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
