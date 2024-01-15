import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zuzu/components/buttons.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/main.dart';
import 'package:zuzu/pages/account_setup/create_pin.dart';
import 'package:zuzu/pages/account_setup/gender_screen.dart';
import 'package:zuzu/pages/account_setup/profile_screen.dart';
import 'package:zuzu/services/auth/auth_service.dart';

class BirthDateScreen extends StatefulWidget {
  const BirthDateScreen({super.key});

  @override
  State<BirthDateScreen> createState() => _BirthDateScreenState();
}

class _BirthDateScreenState extends State<BirthDateScreen> {
  // initial date for birthdate
  DateTime initialDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              // choose your interest
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3.7,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const GenderScreen(),
                          type: PageTransitionType.leftToRight,
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/Other Icons/arrow_back.svg',
                      height: 16,
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        darkMode ? white : greyscale900,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'When is Your Birthday?',
                    style: heading4.copyWith(
                      color: greyscale900,
                    ),
                  ),
                ],
              ),

              // page paragraph
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3.7,
              ),
              Text(
                'Your birthday will not be shown to the public.',
                style: xLargeMedium.copyWith(
                  color: greyscale900,
                ),
              ),

              //
              const SizedBox(
                height: 24,
              ),
              Flexible(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 6.5,
                    ),
                    SvgPicture.asset(
                      'assets/Other Icons/birthday_cake.svg',
                    ),
                    const Spacer(),
                    Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: greyscale050,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${initialDate.month} / ${initialDate.day} / ${initialDate.year}',
                            style: mediumSemibold.copyWith(
                              color: greyscale900,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/Other Icons/calender.svg',
                            width: 16,
                            colorFilter: ColorFilter.mode(
                              greyscale900,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: DatePickerWidget(
                        looping: false,
                        initialDate: initialDate,
                        dateFormat: 'MMMM/dd/yyyy',
                        locale: DatePicker.localeFromString('en'),
                        lastDate: DateTime.now(),
                        pickerTheme: DateTimePickerTheme(
                          dividerColor: greyscale200,
                          itemTextStyle: heading3.copyWith(),
                          itemHeight: 40,
                        ),
                        onChange: (DateTime value, _) {
                          setState(() {
                            initialDate = value;
                          });

                          // debug print birthdate
                          debugPrint(
                              '${initialDate.month} / ${initialDate.day} / ${initialDate.year}');
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // buttons
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: TextOnlyButton(
                        onTap: () {
                          // upon closing the app what page should be open
                          Hive.box('myBox').put('currentPage', 4);

                          Navigator.push(
                            context,
                            PageTransition(
                              child: const CreatePin(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        text: 'Skip',
                        color: primary500,
                        backgroundColor: primary100,
                        roundness: 100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: TextOnlyButton(
                        onTap: () {
                          // upon closing the app what page should be open
                          Hive.box('myBox').put('currentPage', 3);

                          // add item to firestore database
                          AuthService().addItem(
                            'date of birth',
                            '${initialDate.month} / ${initialDate.day} / ${initialDate.year}',
                          );

                          Navigator.push(
                            context,
                            PageTransition(
                              child: const ProfileScreen(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        text: 'Continue',
                        color: white,
                        backgroundColor: primary500,
                        roundness: 100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
