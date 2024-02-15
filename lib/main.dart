import 'package:project/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/user.dart';
import 'selection.dart';
import 'pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Firestore App',
      routes: {
        '/login': (context) => LoginPage(),
        '/selection': (context) => Selection(),
      },
      home: FutureBuilder(
        future: retrieve(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            User user = snapshot.data;
            return HomePage(user);
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }

  Future<User> retrieve() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String email = sp.getString('email');
    String password = sp.getString('password');
    print(email);
    print(password);
    if (email != null) {
      User user = User(email, password);
      return user;
    } else {
      return null;
    }
  }
}
