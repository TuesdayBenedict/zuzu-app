import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zuzu/components/buttons.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/main.dart';
import 'package:zuzu/pages/account_setup/create_pin.dart';
import 'package:zuzu/pages/second_screen.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
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
                          child: const CreatePin(),
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
                    'Set Your Fingerprint',
                    style: heading4.copyWith(
                      color: greyscale900,
                    ),
                  ),
                ],
              ),

              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 8.7,
                      ),
                      Text(
                        'Add a fingerprint to make your account more secure.',
                        style: xLargeMedium.copyWith(
                          color: greyscale900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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
                          Hive.box('myBox').put('currentPage', 6);

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
                          Hive.box('myBox').put('currentPage', 6);

                          Navigator.push(
                            context,
                            PageTransition(
                              child: const SecondScreen(),
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
