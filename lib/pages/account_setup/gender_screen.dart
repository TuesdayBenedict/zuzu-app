import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zuzu/components/buttons.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/main.dart';
import 'package:zuzu/pages/account_setup/birth_date_screen.dart';
import 'package:zuzu/pages/account_setup/create_pin.dart';
import 'package:zuzu/pages/account_setup/interest_screen.dart';
import 'package:zuzu/services/auth/auth_service.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  bool male = true;
  bool female = false;

  String gender = '';

  @override
  Widget build(BuildContext context) {
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
                          child: const InterestScreen(),
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
                    'Tell Us About Yourself',
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
                'Choose your identity & help us to find accurate content for you.',
                style: xLargeMedium.copyWith(
                  color: greyscale900,
                ),
              ),

              // choice chip for gender
              const SizedBox(
                height: 24,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!male) {
                            male = !male;
                            female = !female;

                            // seting gender value
                            gender = 'Male';

                            // debug print gender
                            debugPrint(gender);
                          }
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: male
                              ? gradientRed
                              : LinearGradient(
                                  colors: [greyscale400, greyscale400],
                                ),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/Other Icons/male_choice.svg',
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Male',
                              style: xLargeBold.copyWith(
                                color: white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!female) {
                            female = !female;
                            male = !male;

                            // seting gender value
                            gender = 'Female';

                            // debug print gender
                            debugPrint(gender);
                          }
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: female
                              ? gradientRed
                              : LinearGradient(
                                  colors: [greyscale400, greyscale400],
                                ),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/Other Icons/female_choice.svg',
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Female',
                              style: xLargeBold.copyWith(
                                color: white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
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
                          Hive.box('myBox').put('currentPage', 2);

                          // add item to firestore database
                          AuthService().addItem('gender', gender);

                          Navigator.push(
                            context,
                            PageTransition(
                              child: const BirthDateScreen(),
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
