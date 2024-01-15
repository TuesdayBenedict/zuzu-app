import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zuzu/components/buttons.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/interest_chip.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/models/chip_model.dart';
import 'package:zuzu/pages/account_setup/create_pin.dart';
import 'package:zuzu/pages/account_setup/gender_screen.dart';
import 'package:zuzu/services/auth/auth_service.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
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
              // choose your interest
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3.7,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Choose Your Interest',
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
                'Choose your interests and get the best video recommendations.',
                style: xLargeMedium.copyWith(
                  color: greyscale900,
                ),
              ),

              // choice chips
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 2.7,
              ),

              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView(
                    children: const [
                      Row(
                        children: [
                          InterestChip(index: 0),
                          SizedBox(width: 12),
                          InterestChip(index: 1),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          InterestChip(index: 2),
                          SizedBox(width: 12),
                          InterestChip(index: 3),
                          SizedBox(width: 12),
                          InterestChip(index: 4),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          InterestChip(index: 5),
                          SizedBox(width: 12),
                          InterestChip(index: 6),
                          SizedBox(width: 12),
                          InterestChip(index: 7),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          InterestChip(index: 8),
                          SizedBox(width: 12),
                          InterestChip(index: 9),
                          SizedBox(width: 12),
                          InterestChip(index: 10),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          InterestChip(index: 11),
                          SizedBox(width: 12),
                          InterestChip(index: 12),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          InterestChip(index: 13),
                          SizedBox(width: 12),
                          InterestChip(index: 14),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          InterestChip(index: 15),
                          SizedBox(width: 12),
                          InterestChip(index: 16),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          InterestChip(index: 17),
                          SizedBox(width: 12),
                          InterestChip(index: 18),
                          SizedBox(width: 12),
                          InterestChip(index: 19),
                        ],
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
                          if (chipSelectedItem.isNotEmpty) {
                            // upon closing the app what page should be open
                            Hive.box('myBox').put('currentPage', 1);

                            // add item to firestore database
                            AuthService().addItem('interest', chipSelectedItem);

                            Navigator.push(
                              context,
                              PageTransition(
                                child: const GenderScreen(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select an Item',
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
