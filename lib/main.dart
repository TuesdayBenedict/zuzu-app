import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zuzu/firebase_options.dart';
import 'package:zuzu/models/theme_model.dart';
import 'package:zuzu/pages/onboarding/onboarding_screen.dart';
import 'package:zuzu/services/auth/auth_gate.dart';
import 'package:zuzu/services/auth/auth_service.dart';

void main() async {
  // firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initializing Hive for local storage
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// darkmode made accessible to all pages
dynamic darkMode;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Hive.box('myBox').put('darkmode', false);
    // For Dark and Light Mode
    darkMode = Hive.box('myBox').get('darkmode', defaultValue: false);

    // To check if the user has seen the onboarding_screen once
    var seenOnBoardScreen = Hive.box('myBox').get(
      'seenonboardscreen',
      defaultValue: false,
    );

    return ValueListenableBuilder(
      valueListenable: Hive.box('myBox').listenable(),
      builder: (context, box, widget) {
        return MaterialApp(
          theme: MyAppThemes.lightTheme,
          darkTheme: MyAppThemes.darkTheme,
          //themeMode: ThemeMode.system,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: seenOnBoardScreen ? const AuthGate() : const OnBoardingPage(),
        );
      },
    );
  }
}
