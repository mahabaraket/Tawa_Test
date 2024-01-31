import 'package:flutter/material.dart';
import 'package:test_tawa/design_system/atoms/spacings/size_config.dart';

import '../../core/constants/constants.dart';

class OnboardScreen extends StatefulWidget {
  final String? image;
  final String? text;
  const OnboardScreen({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          widget.image!,
          height: 220,
          width: 260,
        ),
        const SizedBox(height: 100),
        SizedBox(
          width: 287,
          height: 86,
          child: Text(
            widget.text!,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 21,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ).copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
