import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import './signinfrom.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/backarrow.svg',
            fit: BoxFit.scaleDown,
          ),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        title: const Text("Sign In",
            style: TextStyle(
                color: Color(0xFF6B5CD2),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w300,
                height: 0.05)),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 109),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 130),
                    child: SizedBox(
                      width: 234,
                      height: 81,
                      child: Container(
                          decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit
                              .fill, // Use BoxFit.contain to maintain aspect ratio
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SignForm(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
