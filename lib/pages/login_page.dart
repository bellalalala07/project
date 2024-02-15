import '../selection.dart';
import 'package:project/services/firebaseauth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controllers for e-mail and password textfields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool signUp = true;

  final formGlobalKey = GlobalKey<FormState>();

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 400,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.white70,
                            ),
                            labelText: "Email",
                            labelStyle:
                                TextStyle(color: Colors.white.withOpacity(0.9)),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            ),
                          ),
                          validator: (email) {
                            if (isEmailValid(email))
                              return null;
                            else if (email.isEmpty) {
                              return 'Please enter email address';
                            } else
                              return 'Please enter a valid email address (Ex:bellalu@abc.com).';
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.white70,
                            ),
                            labelText: "Password",
                            labelStyle:
                                TextStyle(color: Colors.white.withOpacity(0.9)),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                            ),
                          ),
                          validator: (password) {
                            if (isPasswordValid(password))
                              return null;
                            else if (password.isEmpty) {
                              return 'Please enter password';
                            } else
                              return 'Password should contain 8 characters,upper,lower,digit and speical character';
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //Sign in / Sign up button
                RaisedButton(
                  onPressed: () async {
                    if (formGlobalKey.currentState.validate()) {
                      if (signUp) {
                        var newuser = await FirebaseAuthService().signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        if (newuser != null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Selection()));
                        }
                      } else {
                        var reguser = await FirebaseAuthService().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        if (reguser != null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Selection()));
                        }
                      }
                    }
                  },
                  child: signUp ? Text("Sign Up") : Text("Sign In"),
                ),
                //Sign up / Sign In toggler
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      save();
                      signUp = !signUp;
                    });
                  },
                  child: signUp
                      ? Text("Have an account? Sign In")
                      : Text(
                          "Create an account",
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  save() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (emailController.text != '') {
      await sp.setString('email', emailController.text);
    }
    if (passwordController.text != '') {
      await sp.setString('password', passwordController.text);
    }
  }
}
