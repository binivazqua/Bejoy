import 'package:bejoy/auth/authVerif.dart';
import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

/* ++++++++++++++++++++++++ FIREBASE ++++++++++++++++++++++++++ */
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Future<FirebaseApp> _firebase = Firebase.initializeApp();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Pro'),
        home: FutureBuilder(
            future: _firebase,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('There is an error somewhere around here...');
                return Text('Somethin went WRONG! PIPIPI');
              } else if (snapshot.hasData) {
                return authVerif();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
