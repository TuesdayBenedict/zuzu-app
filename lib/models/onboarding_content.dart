// The Icon parameter was not longer used in the program
// Used a different method for the icon in the onboarding page

class OnBoardingItem {
  String title;
  String buttonText;

  OnBoardingItem({required this.title, required this.buttonText});
}

List<OnBoardingItem> onBoardingContents = [
  OnBoardingItem(
    title: 'Watch interesting videos from around the world',
    buttonText: 'Next',
  ),
  OnBoardingItem(
    title: 'Find your friends and play together on social media',
    buttonText: 'Next',
  ),
  OnBoardingItem(
      title: 'Let\'s have fun with your friends & zuzu right now!',
      buttonText: 'Get Started'),
];
