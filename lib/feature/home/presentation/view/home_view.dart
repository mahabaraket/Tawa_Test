import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_tawa/design_system/molecules/nav_bar/customnavbar.dart';
import 'package:test_tawa/core/http/apiservice.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  final Map<String, dynamic>? userProfile;

  const HomeScreen({Key? key, this.userProfile}) : super(key: key);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String userName;

  @override
  void initState() {
    super.initState();
    // Extract user name from the userProfile map
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    Map<String, dynamic>? userProfile = await ApiService.getUserProfile();
    if (userProfile != null) {
      setState(() {
        userName = userProfile['fullname'];
      });
    } else {
      print('Failed to fetch user profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
            fit: BoxFit.scaleDown,
          ),
          onPressed: () => {},
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/bell.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () => {},
          )
        ],
      ),
      body: Center(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 73),
          SizedBox(
            //   width: 324,

            child: Text(
              'Hello samy.chaffai,',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 55),
          SizedBox(
            //  width: 324,

            child: Text(
              'Your account is not approved yet,',
              style: TextStyle(
                color: Color(0xFF6B5CD2),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 33),
          SizedBox(
            width: 324,
            child: Text(
              'Please complete your profile information to approve your account.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF5C5C5C),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                //height: 0.10,
              ),
            ),
          ),
          SizedBox(height: 109),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2196F3),
                padding:
                    EdgeInsets.only(top: 7, bottom: 9, left: 16, right: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  // Text color
                ),
                fixedSize: Size(132, 36),
              ),
              onPressed: () => {},
              child: Text(
                "Setup account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                ),
              ))
        ],
      )),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
