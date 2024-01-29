import 'package:flutter/material.dart';
import 'package:test_tawa/design_system/atoms/colors/colors.dart';
import 'package:test_tawa/design_system/atoms/colors/constants.dart';
import 'package:test_tawa/feature/login/login_screen.dart';
import 'package:test_tawa/feature/onbording/onboarding.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardContent extends StatefulWidget {
  static String routeName = "/splash";

  const OnboardContent({Key? key}) : super(key: key);
  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Map<String, String>> splashData = [
    {
      "text": "Create, manage and showcase your profile for collaboration.",
      "image": "assets/images/image 1.png"
    },
    {
      "text": "Search for collaboration opportunities and apply instantly.",
      "image": "assets/images/image2.png"
    },
    {
      "text":
          "Manage your collaborations, contracts and content creation all in one app.",
      "image": "assets/images/image3.png"
    },
    {
      "text":
          "Track your performance and access to detailed analytics & reports",
      "image": "assets/images/image4.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFFFF4B81), Color(0xFF3421A6)],
          ),
        ),
        child: SafeArea(
          child: Container(
            alignment: AlignmentDirectional.center,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => OnboardScreen(
                        image: splashData[index]["image"]!,
                        text: splashData[index]['text']!,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.all(10),
                                height: 11,
                                width: 11,
                                decoration: BoxDecoration(
                                  color: currentPage == index
                                      ? Colors.white
                                      : const Color(0xFFB2B3BD),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(flex: 3),
                          if (currentPage < splashData.length - 1)
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/Arrow.svg",
                                width: 50,
                                height: 50,
                              ),
                              onPressed: () {
                                _navigateToNextPage();
                              },
                            ),
                          if (currentPage == splashData.length - 1)
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0x00D9D9D9),
                                onPrimary: AppColors.twhite,
                                padding: const EdgeInsets.only(
                                  top: 16,
                                  bottom: 19,
                                  left: 26,
                                  right: 21,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                fixedSize: const Size(188, 55),
                              ),
                              child: const Text("Let's get Started"),
                            ),
                          if (currentPage == splashData.length - 1)
                            const Spacer(),
                          if (currentPage < splashData.length - 1)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {
                                  _skipToLastItem();
                                },
                                child: const Text(
                                  "SKIP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _skipToLastItem() {
    setState(() {
      _pageController.animateToPage(
        splashData.length - 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }
}
