import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    required this.email,
    required this.backgroundColor,
    required this.textColor,
  });

  final TextEditingController email;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: email,
        style: mediumSemibold.copyWith(
          color: textColor,
        ),
        obscureText: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: mediumRegular.copyWith(
            color: greyscale500,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
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
          prefixIcon: SvgPicture.asset(
            'assets/Iconly/Bold/Message.svg',
            height: 10,
            width: 10,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              greyscale500,
              BlendMode.srcIn,
            ),
          ),
          filled: true,
          fillColor: backgroundColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          } else if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        onEditingComplete: () {},
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.password,
    required this.backgroundColor,
    required this.textColor,
  });

  final TextEditingController password;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: password,
        style: mediumSemibold.copyWith(
          color: textColor,
        ),
        obscureText: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: mediumRegular.copyWith(
            color: greyscale500,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          errorStyle: mediumSemibold.copyWith(
            color: primary500,
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
          prefixIcon: SvgPicture.asset(
            'assets/Iconly/Bold/Lock.svg',
            height: 10,
            width: 10,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              greyscale500,
              BlendMode.srcIn,
            ),
          ),
          filled: true,
          fillColor: backgroundColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          suffixIcon: SvgPicture.asset(
            'assets/Iconly/Bold/Hide.svg',
            height: 15,
            width: 15,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              greyscale500,
              BlendMode.srcIn,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }
}
