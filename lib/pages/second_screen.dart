import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zuzu/services/auth/auth_service.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // sign user out
    void signOut() {
      // get auth service
      final authService = Provider.of<AuthService>(context, listen: false);

      authService.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          // sign out button
          IconButton(
            onPressed: signOut,
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
    );

    // return ValueListenableBuilder(
    //   valueListenable: Hive.box('myBox').listenable(),
    //   builder: (context, box, widget) {
    //     var darkmode = Hive.box('myBox').get('darkmode');
    //     return Scaffold(
    //       backgroundColor: Theme.of(context).colorScheme.background,
    //       appBar: AppBar(
    //         title: const Text('Home Screen'),
    //         actions: [
    //           // sign out button
    //           IconButton(
    //             onPressed: signOut,
    //             icon: const Icon(
    //               Icons.logout,
    //             ),
    //           ),
    //         ],
    //       ),
    //       body: Column(
    //         children: [
    //           Text(
    //             'Please click to switch between light and darkmode',
    //             style: mediumBold.copyWith(
    //               color: Theme.of(context).colorScheme.onBackground,
    //             ),
    //           ),
    //           Switch(
    //             value: darkmode,
    //             onChanged: (value) {
    //               setState(() {
    //                 Hive.box('myBox').put('darkmode', value);
    //               });
    //             },
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
