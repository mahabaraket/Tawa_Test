import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_tawa/design_system/atoms/colors/constants.dart';
import 'package:test_tawa/design_system/molecules/FormError/form_error.dart';
import 'package:test_tawa/design_system/molecules/custum_surfic_icon/custum_surfix_icon.dart';
import 'package:test_tawa/design_system/organismes/keyboard.dart';
import 'package:test_tawa/feature/home/domain/apiservice.dart';

import 'package:test_tawa/feature/home/presentation/view/home_view.dart';
import 'package:test_tawa/feature/login/signin_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //bool ApiCall_State = false;

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  //bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: const ValueKey('email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kInvalidEmailError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: knullEmailError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              // labelText: "Email",
              hintText: "Email",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFF979797)),
              ),

              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/mail.svg"),
            ),
          ),
          const SizedBox(height: 15),

          TextFormField(
            key: const ValueKey('password'),
            controller: passwordController,
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              // labelText: "Password",
              hintText: "Password",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFF979797)),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/eye.svg"),
            ),
          ),
          const SizedBox(height: 2),

          FormError(errors: errors),
          const SizedBox(height: 58),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, primary: Color(0xFF6B5CD2),
                padding:
                    EdgeInsets.only(top: 19, bottom: 20, left: 92, right: 92),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Text color
                ),
                //fixedSize: Size(200, 40),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  String email = emailController.text;
                  String password = passwordController.text;

                  ApiService.login(email, password).then((response) {
                    if (response) {
                      print("res$response");
                      var token = ApiService.getStoredToken();
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.routeName, (route) => false);
                    } else {
                      Get.offAll(SignInScreen());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid email or password'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  });

                  // Do something with the values
                  print('Email: $email');
                  print(
                      'Password: $password'); // if all are valid then go to success screen
                  KeyboardUtil.hideKeyboard(context);
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              },
              child: const Text("Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    //height: 0.06,
                  ))),
          //const Spacer(),
          const SizedBox(height: 23),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => {},
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    color: Color(0xFF6B5CD2),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
