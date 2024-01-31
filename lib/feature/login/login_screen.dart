import 'package:flutter/material.dart';
import 'package:test_tawa/design_system/atoms/spacings/size_config.dart';
import 'package:test_tawa/feature/login/signin_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/Login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFF3421A6),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF2196F3), Color(0xFF3421A6)],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 154,
                    height: 9,
                    child: Container(
                        decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 100, // Adjust the height as needed
                    // width: 120, // Adjust the width as needed
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30), // Adjust the margin-top value
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit
                                .contain, // Use BoxFit.contain to maintain aspect ratio
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF6B5CD2), // Button color
                      onPrimary: Colors.white,
                      padding: EdgeInsets.only(
                          top: 19, bottom: 20, left: 92, right: 92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Text color
                      ),
                      fixedSize: Size(244, 59),
                    ),
                    child: Text("Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0.06,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "I'don't have an account",
                        style: TextStyle(
                          color: Color(0xFF6B5CD2),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                  // Other widgets go here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
