import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_tawa/design_system/atoms/colors/colors.dart';
//import 'package:shop_app/screens/home/home_screen.dart';

//import 'package:shop_app/screens/profile/profile_screen.dart';

//import '../constants.dart';
//import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    // required this.selectedMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      width: 312,
      margin: EdgeInsets.only(left: 35, right: 43, bottom: 42),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF6B5CD2),
        borderRadius: BorderRadius.circular(30),
        //border: BorderSide(width: 0.50, color: Color(0xFF808191)),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/loop.svg",
                  ),
                  onPressed: () => print("home")),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/SVGRepo_iconCarrier.svg"),
                onPressed: () {},
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/folder.svg",
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/frame.svg",
                  ),
                  onPressed: () {}),
            ],
          )),
    );
  }
}
