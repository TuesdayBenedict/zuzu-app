import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/main.dart';
import 'package:zuzu/models/onboarding_content.dart';
import 'package:zuzu/pages/letsin/letsin_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  // Page Controller to tell the page you are in the onboarding
  final PageController _pageController = PageController(initialPage: 0);

  // Dot Indicator Container in the page
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(
        right: 8,
      ),
      duration: const Duration(milliseconds: 400),
      height: 8,
      width: currentPage == index ? 32 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? primary500
            : darkMode
                ? greyscale300.withOpacity(0.2)
                : greyscale300,
        borderRadius: BorderRadius.circular(100),
        shape: BoxShape.rectangle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                itemCount: onBoardingContents.length,
                controller: _pageController,
                scrollBehavior: const ScrollBehavior(),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 10,
                      ),

                      // The svg images for the onboarding screen
                      // Named 1, 2, 3 .svg respectively
                      // So the index + 1 will start the count from 1 to the
                      // last index
                      SvgPicture.asset(
                        darkMode
                            ? 'assets/onboard_icons/${index + 1}_dark.svg'
                            : 'assets/onboard_icons/${index + 1}.svg',
                        height: SizeConfig.blockSizeVertical! * 30,
                      ),
                      Text(
                        onBoardingContents[index].title,
                        style: heading2.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingContents.length,
                (index) => dotIndicator(index),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),

            // To Transit to the next page in onboarding
            ElevatedButton(
              onPressed: () {
                // Transition to next page

                // If it is the last page
                currentPage == (onBoardingContents.length - 1)
                    ? _pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        curve: Curves.easeOut,
                      )
                    :
                    // Previous pages before the last page
                    _pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        curve: Curves.easeInOut,
                      );

                // Button transit to home page to authenticate if a user is loged in
                // if a user is loged in; it will go straight to home_page
                // if not it will go to lets in
                if (currentPage == (onBoardingContents.length - 1)) {
                  // change the value of seenonboardscreen to true in local storage
                  // Hive.box('myBox').put('seenonboardscreen', true);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LetsinScreen(),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey.withOpacity(0.5);
                    }
                    return primary500;
                  },
                ),
              ),
              child: Text(
                onBoardingContents[currentPage].buttonText,
                style: largeBold.copyWith(
                  color: white,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 3,
            ),
          ],
        ),
      ),
    );
  }
}
