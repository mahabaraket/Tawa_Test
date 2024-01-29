import 'package:flutter/material.dart';
import 'package:test_tawa/design_system/atoms/spacings/size_config.dart';
import 'package:test_tawa/design_system/atoms/colors/colors.dart';

//import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color color;

  final Function() onPress;

  const CustomButton({
    Key? key,
    this.text,
    this.press,
    required this.color,
    required this.onPress,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: AppColors.btnColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
