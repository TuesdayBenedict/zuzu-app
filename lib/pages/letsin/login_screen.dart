import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zuzu/components/buttons.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/components/text_input.dart';
import 'package:zuzu/main.dart';
import 'package:zuzu/services/auth/auth_service.dart';

// vertical height responsive: 0.115
// horizontal width responsive: 0.242

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // remember password variable
  bool checked = false;

  // Form variables and validation
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      //loading

      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
      });

      signIn();
    }
  }

  // signin
  void signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
        email.text,
        password.text,
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
            style: TextStyle(
              color: white,
            ),
          ),
          backgroundColor: greyscale900,
        ),
      );
    }
  }

  // with facebook
  void signInWithFacebook() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithFacebook();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
            style: TextStyle(
              color: white,
            ),
          ),
          backgroundColor: greyscale900,
        ),
      );
    }
  }

  // with google
  void signInWithGoogle() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithGoogle();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.blockSizeVertical! * 96,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 3.91,
                    ),

                    // Back Arrow - Removed because isn't necessary
                    // It doesn't keep record of any previous route
                    // because of function that switches from signup and login
                    // it doesn't use material page route to switch

                    /* Row(
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
                    ),*/

                    // page heading: create your accuont
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      'Login to your Account',
                      style: heading1.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        height: 1.2,
                      ),
                    ),

                    // email input
                    const Spacer(
                      flex: 2,
                    ),
                    EmailInput(
                      email: email,
                      backgroundColor: darkMode ? dark2 : greyscale050,
                      textColor: darkMode ? white : greyscale900,
                    ),

                    // password input
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.76,
                    ),
                    PasswordInput(
                      password: password,
                      backgroundColor: darkMode ? dark2 : greyscale050,
                      textColor: darkMode ? white : greyscale900,
                    ),

                    // remember me
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.76,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            // reversing the value of the checked state
                            setState(() {
                              checked = !checked;
                            });
                          },
                          icon: SvgPicture.asset(
                            checked
                                ? 'assets/Other Icons/checked.svg'
                                : 'assets/Other Icons/unchecked.svg',
                            height: 24,
                            width: 24,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: mediumSemibold.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),

                    // login button
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.76,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextOnlyButton(
                            onTap: () {
                              // adding checked information to local storage

                              // sign in
                              _submitForm();
                            },
                            text: 'Sign in',
                            color: white,
                            backgroundColor: _isLoading
                                ? primary500.withOpacity(0.2)
                                : primary500,
                            roundness: 100,
                          ),
                        ),
                        _isLoading
                            ? Image.asset(
                                'assets/splash_screen/loader.gif',
                                height: 50,
                              )
                            : Container()
                      ],
                    ),

                    // forgot password
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.76,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot the password?',
                        style: largeSemibold.copyWith(
                          color: primary500,
                        ),
                      ),
                    ),

                    // or continue with

                    const Spacer(
                      flex: 2,
                    ),

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
                            height: 30,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'or continue with',
                                style: xLargeSemibold.copyWith(
                                  color: darkMode ? white : greyscale700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 3.45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconOnlyButton(
                          onTap: () {
                            signInWithFacebook();
                          },
                          text: '',
                          iconName: 'facebook',
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 4.84,
                        ),
                        IconOnlyButton(
                          onTap: () {
                            signInWithGoogle();
                          },
                          text: '',
                          iconName: 'google',
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 4.84,
                        ),
                        IconOnlyButton(
                          onTap: () {},
                          text: '',
                          iconName: darkMode ? 'apple-white' : 'apple-dark',
                        ),
                      ],
                    ),

                    // don't have an account? sign up
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
                          onPressed: widget.onTap,
                          child: Text(
                            'Sign up',
                            style: mediumSemibold.copyWith(
                              color: primary500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
