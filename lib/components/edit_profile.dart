import 'package:zuzu/pages/account_setup/birth_date_screen.dart';
import 'package:zuzu/pages/account_setup/create_pin.dart';
import 'package:zuzu/pages/account_setup/fingerprint_screen.dart';
import 'package:zuzu/pages/account_setup/gender_screen.dart';
import 'package:zuzu/pages/account_setup/interest_screen.dart';
import 'package:zuzu/pages/account_setup/profile_screen.dart';
import 'package:zuzu/pages/second_screen.dart';

List allProfile = [
  const InterestScreen(),
  const GenderScreen(),
  const BirthDateScreen(),
  const ProfileScreen(),
  const CreatePin(),
  const FingerprintScreen(),
  const SecondScreen(),
];
