import 'package:flutter/material.dart';
import 'package:test_tawa/feature/onbording/onboardcontent.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({Key? key, this.image, impo}) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const int splashScreenDuration = 3; // 3 seconds
    Future.delayed(const Duration(seconds: splashScreenDuration), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardContent()),
      );
    });
    //   SizeConfig().init(context);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: width,
          height: heigth,
          decoration: const BoxDecoration(color: Colors.white),
        ),
        Container(
          width: 234,
          height: 56,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
