import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:zuzu/components/buttons.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/main.dart';
import 'package:zuzu/pages/account_setup/fingerprint_screen.dart';
import 'package:zuzu/pages/account_setup/profile_screen.dart';
import 'package:zuzu/services/auth/auth_service.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({super.key});

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  // controller
  TextEditingController pin = TextEditingController();

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
                          child: const ProfileScreen(),
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
                    'Create New PIN',
                    style: heading4.copyWith(
                      color: greyscale900,
                    ),
                  ),
                ],
              ),

              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // page paragraph

                    Text(
                      'Add a PIN number to make your account more secure.',
                      style: xLargeRegular.copyWith(
                        color: greyscale900,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // pin entry
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 9.2,
                    ),
                    Pinput(
                      controller: pin,
                      defaultPinTheme: PinTheme(
                        width: 80,
                        height: 60,
                        textStyle: heading4.copyWith(
                          color: greyscale900,
                        ),
                        decoration: BoxDecoration(
                          color: greyscale050,
                          border: Border.all(
                            color: greyscale200,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 80,
                        height: 60,
                        textStyle: heading4.copyWith(
                          color: greyscale900,
                        ),
                        decoration: BoxDecoration(
                          color: primary500.withOpacity(0.08),
                          border: Border.all(
                            color: primary500,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      obscureText: true,
                      obscuringWidget: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: greyscale900,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),

                    // continue
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 13,
                    ),
                    SizedBox(
                      child: TextOnlyButton(
                        onTap: () {
                          if (pin.length == 4) {
                            // upon closing the app what page should be open
                            Hive.box('myBox').put('currentPage', 5);

                            // add item to firestore database
                            AuthService().addItem('pin', pin);

                            Navigator.push(
                              context,
                              PageTransition(
                                child: const FingerprintScreen(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Create a valid pin',
                                  style: TextStyle(
                                    color: white,
                                  ),
                                ),
                                backgroundColor: greyscale900,
                                showCloseIcon: true,
                                closeIconColor: white,
                              ),
                            );
                          }
                        },
                        text: 'Continue',
                        color: white,
                        backgroundColor: primary500,
                        roundness: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
