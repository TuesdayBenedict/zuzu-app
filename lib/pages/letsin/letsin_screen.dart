import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuzu/components/buttons.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/main.dart';
import 'package:zuzu/services/auth/login_or_register.dart';

// vertical height responsive: 0.115
// horizontal width responsive: 0.242

class LetsinScreen extends StatefulWidget {
  const LetsinScreen({super.key});

  @override
  State<LetsinScreen> createState() => _LetsinScreenState();
}

class _LetsinScreenState extends State<LetsinScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3.91,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    darkMode
                        ? 'assets/letsIn/1_dark.svg'
                        : 'assets/letsIn/1.svg',
                    height: SizeConfig.blockSizeVertical! * 23,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Let\'s you in',
                    style: heading1.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              OneIconButton(
                onTap: () {},
                text: 'Continue with Facebook',
                iconName: 'facebook',
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 1.84,
              ),
              OneIconButton(
                onTap: () {},
                text: 'Continue with Google',
                iconName: 'google',
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 1.84,
              ),
              OneIconButton(
                onTap: () {},
                text: 'Continue with Apple',
                iconName: darkMode ? 'apple-white' : 'apple-dark',
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    color: darkMode ? dark3 : greyscale200,
                    thickness: 1,
                  ),
                  Center(
                    child: Container(
                      color: darkMode ? dark1 : white,
                      width: 50,
                      height: 30,
                      child: Text(
                        'or',
                        style: xLargeSemibold.copyWith(
                          color: darkMode ? white : greyscale900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextOnlyButton(
                  onTap: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => LoginOrRegister(
                          showLoginPage: true,
                        ),
                      ),
                    );
                  },
                  text: 'Sign in with password',
                  color: white,
                  backgroundColor: primary500,
                  roundness: 100,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: mediumRegular.copyWith(
                      color: darkMode ? white : greyscale500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        (context),
                        MaterialPageRoute(
                          builder: (context) => LoginOrRegister(
                            showLoginPage: false,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: mediumSemibold.copyWith(
                        color: primary500,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
