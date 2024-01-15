import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zuzu/components/buttons.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/main.dart';
import 'package:zuzu/pages/account_setup/birth_date_screen.dart';
import 'package:zuzu/pages/account_setup/create_pin.dart';
import 'package:zuzu/services/auth/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // controllers
  TextEditingController fullName = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  // firestore instance
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // firebase atuh instance
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: SizeConfig.blockSizeVertical! * 96,
              width: double.infinity,
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
                                child: const BirthDateScreen(),
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
                          'Fill Your Profile',
                          style: heading4.copyWith(
                            color: greyscale900,
                          ),
                        ),
                      ],
                    ),

                    // profile image
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 3.7,
                    ),
                    SizedBox(
                      height: 140,
                      width: 140,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/Other Icons/profile.png',
                            height: 140,
                            width: 140,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/Iconly/Bold/Edit Square.svg',
                                width: 30,
                                colorFilter: ColorFilter.mode(
                                  primary500,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 55,
                      child: ListView(
                        children: [
                          // full name
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: fullName,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: greyscale050,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: greyscale900,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary500,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorStyle: mediumSemibold.copyWith(
                                color: primary500,
                              ),
                              hintText: 'Full Name',
                              hintStyle: mediumRegular.copyWith(
                                color: greyscale500,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                            ),
                            style: mediumSemibold.copyWith(
                              color: greyscale900,
                            ),
                          ),

                          // nickname
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: nickname,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter a nickname';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: greyscale050,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: greyscale900,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary500,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorStyle: mediumSemibold.copyWith(
                                color: primary500,
                              ),
                              hintText: 'Nickname',
                              hintStyle: mediumRegular.copyWith(
                                color: greyscale500,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                            ),
                            style: mediumSemibold.copyWith(
                              color: greyscale900,
                            ),
                          ),

                          // Email
                          const SizedBox(height: 20),
                          Container(
                            height: 56,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: greyscale050,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Email',
                                  style: mediumRegular.copyWith(
                                    color: greyscale500,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/Iconly/Curved/Message.svg',
                                  fit: BoxFit.scaleDown,
                                  width: 20,
                                  colorFilter: ColorFilter.mode(
                                    greyscale500,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // phone number
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber value) {},
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textFieldController: phone,
                              spaceBetweenSelectorAndTextField: 0,
                              inputDecoration: InputDecoration(
                                hintStyle: mediumRegular.copyWith(
                                  color: greyscale500,
                                ),
                                hintText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: greyscale900,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: primary500,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorStyle: mediumSemibold.copyWith(
                                  color: primary500,
                                ),
                                fillColor: greyscale050,
                                filled: true,
                              ),
                              formatInput: true,
                              textStyle: mediumBold.copyWith(
                                color: greyscale900,
                              ),
                              selectorTextStyle: mediumBold.copyWith(
                                color: greyscale900,
                              ),
                              selectorConfig: const SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                                trailingSpace: false,
                              ),
                              initialValue: PhoneNumber(isoCode: 'NG'),
                            ),
                          ),

                          // Address
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: address,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter a valid address';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: greyscale050,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: greyscale900,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary500,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorStyle: mediumSemibold.copyWith(
                                color: primary500,
                              ),
                              hintText: 'Address',
                              hintStyle: mediumRegular.copyWith(
                                color: greyscale500,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                              suffixIcon: SvgPicture.asset(
                                'assets/Iconly/Curved/Location.svg',
                                fit: BoxFit.scaleDown,
                                width: 20,
                                colorFilter: ColorFilter.mode(
                                  greyscale500,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            style: mediumSemibold.copyWith(
                              color: greyscale900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),

                    // buttons
                    const SizedBox(
                      height: 20,
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
                                if (_formKey.currentState!.validate()) {
                                  // upon closing the app what page should be open
                                  Hive.box('myBox').put('currentPage', 4);

                                  // add item to firestore database
                                  AuthService().addItem(
                                    'profile',
                                    {
                                      'full name': fullName.text,
                                      'nickname': nickname.text,
                                      'email': 'email',
                                      'phone': phone.text,
                                      'address': address.text,
                                    },
                                  );

                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const CreatePin(),
                                      type: PageTransitionType.rightToLeft,
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
          ),
        ),
      ),
    );
  }
}
