import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/components/size_config.dart';
import 'package:zuzu/main.dart';

class OneIconButton extends StatelessWidget {
  const OneIconButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.iconName,
  });

  final String text;
  final String iconName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: darkMode ? dark3 : greyscale200,
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey.withOpacity(0.5);
            }
            return darkMode ? dark2 : white;
          },
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/Other Icons/$iconName.svg',
            width: 23,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: largeBold.copyWith(
              color: darkMode ? white : greyscale900,
            ),
          ),
        ],
      ),
    );
  }
}

class TextOnlyButton extends StatelessWidget {
  const TextOnlyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.backgroundColor,
    required this.roundness,
  });

  final VoidCallback onTap;
  final String text;
  final double roundness;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ElevatedButton(
      onPressed: onTap,
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
            borderRadius: BorderRadius.circular(roundness),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey.withOpacity(0.5);
            }
            return backgroundColor;
          },
        ),
      ),
      child: Text(
        text,
        style: largeBold.copyWith(
          color: color,
        ),
      ),
    );
  }
}

class IconOnlyButton extends StatelessWidget {
  const IconOnlyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.iconName,
  });

  final String text;
  final String iconName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: darkMode ? dark3 : greyscale200,
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey.withOpacity(0.5);
            }
            return darkMode ? dark2 : white;
          },
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/Other Icons/$iconName.svg',
            width: 23,
          ),
        ],
      ),
    );
  }
}
