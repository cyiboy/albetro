import 'package:albetro/app/global_widgets/input.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../routes/pages.dart';
import '../../core/p.dart';
import '../../core/theme/color_theme.dart';
import '../../global_widgets/button.dart';
import '../../global_widgets/custom_appbar.dart';
import '../../global_widgets/space.dart';

class TravellersDetails extends StatefulWidget {
  @override
  State<TravellersDetails> createState() => _TravellersDetailsState();
}

class _TravellersDetailsState extends State<TravellersDetails> {
 String val = 'Male';
 String initialCountry = 'NG';
 PhoneNumber number = PhoneNumber(isoCode: 'NG');

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Surface,
      appBar: CustomAppBar(
        title: 'Traveller Details',
      ),
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 0, top: 10, bottom: 15),
                      child: Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/info.svg',
                              color: Surface.withOpacity(0.5),
                            ),
                            Space.X(10),
                            Text(
                              'These details must match passport and photo ID',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color:Surface),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ),
             Row(
               children: [
               Expanded(child:   ListTile(
                 title: Text(
                   "Male",
                   style: TextStyle(color: textColor),
                 ),
                 leading: Radio(
                   value: 'Male',
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
               ),),
                 Expanded(child:   ListTile(
                   title: Text(
                     "Male",
                     style: TextStyle(color: textColor),
                   ),
                   leading: Radio(
                     value: 'Female',
                     fillColor: MaterialStateProperty.all<Color>(
                        textColor),
                     groupValue: val,
                     onChanged: (value) {
                       setState(() {
                         val = value.toString();
                       });
                     },
                     activeColor: textColor,
                   ),
                 ),)
               ],
             ),
                  Space.Y(20),
                  Row(
                    children: [
                      Expanded(
                        child: Input(type: InputType.text,
                        label: 'FIRST NAME',
                        ),
                      ),
                      Space.X(10),
                      Expanded(
                        child: Input(type: InputType.text,
                          label: 'LAST NAME',
                        ),
                      ),
                    ],
                  ),
                  Space.Y(20),
                  Input(type: InputType.email,
                    label: 'EMAIL',
                  ),
                  Space.Y(10),
                  Text(
                    'Your ticket will be sent to above email',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color:textColor.withOpacity(0.3)),
                  ),
                  Space.Y(10),
                  Input(type: InputType.number,
                    label: 'PHONE NUMBER',
                  ),
                  Space.Y(20),
                  Row(
                    children: [
                      Expanded(
                        flex:1 ,
                        child: GestureDetector(
                          onTap: (){
                            showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  flagSize: 25,
                                  backgroundColor: cards,
                                  textStyle: TextStyle(fontSize: 16, color: textColor),
                                  borderRadius: BorderRadius.all(Radius.circular(15.0),),
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFFFFFFFF).withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                                onSelect: (Country country) =>
                                P.flight.nationality.text = country.name
                            );
                          },
                          child:
                          Input(
                            label: 'Nationality',
                            active: false,
                            type: InputType.text,
                            controller: P.flight.nationality,
                          ),
                        ),
                      ),
                      Space.X(10),
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
                                  P.flight.dob.text = date.year.toString()+" : "+date.month.toString()+" : "+date.day.toString();

                                }, currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                          child: Input(
                            label: 'Date of Birth',
                            active: false,
                            type: InputType.date,
                            controller: P.flight.dob,
                            validator: (v) => v!.isNotEmpty ? null : "Field is required ",

                          ),
                        ),
                      ),
                    ],
                  ),
                  Space.Y(40),
                  Text(
                    'PASSPORT DETAILS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color:textColor.withOpacity(0.3)),
                  ),
                  Space.Y(10),
                  Input(type: InputType.number,
                    label: 'PASSPORT NUMBER',
                  ),
                  Space.Y(20),
                  Row(
                    children: [
                      Expanded(
                        flex:1 ,
                        child: GestureDetector(
                          onTap: (){
                            showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  flagSize: 25,
                                  backgroundColor: cards,
                                  textStyle: TextStyle(fontSize: 16, color: textColor),
                                  borderRadius: BorderRadius.all(Radius.circular(15.0),),
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFFFFFFFF).withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                                onSelect: (Country country) =>
                                P.flight.inssuing_country.text = country.name
                            );
                          },
                          child:
                          Input(
                            label: 'ISSUING COUNTRY',
                            active: false,
                            type: InputType.text,
                            controller: P.flight.inssuing_country,
                          ),
                        ),
                      ),
                      Space.X(10),
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
                                  P.flight.expiry.text = date.year.toString()+" : "+date.month.toString()+" : "+date.day.toString();

                                }, currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                          child: Input(
                            label: 'EXPIRY',
                            active: false,
                            type: InputType.date,
                            controller: P.flight.expiry,
                            validator: (v) => v!.isNotEmpty ? null : "Field is required ",

                          ),
                        ),
                      ),
                    ],
                  ),
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
                                Get.toNamed( Routes.REVIEWPAY);
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
