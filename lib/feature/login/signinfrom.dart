import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_tawa/core/constants/constants.dart';
import 'package:test_tawa/design_system/molecules/FormError/form_error.dart';
import 'package:test_tawa/design_system/molecules/custum_surfic_icon/custum_surfix_icon.dart';
import 'package:test_tawa/design_system/organismes/keyboard.dart';
import 'package:test_tawa/core/http/apiservice.dart';

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
  bool obscurePassword = true;
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
          Column(
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: Color(0xFF979797)),
                  ),

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSurffixIcon(
                    svgIcon: "assets/icons/mail.svg",
                    /*   onPressed: () {
                        print("emain");
                      } */
                  ),
                ),
              ),
              FormError(
                  errors: errors
                      .where((error) => error == knullEmailError)
                      .toList()),
            ],
          ),

          const SizedBox(height: 5),

          Column(
            children: [
              TextFormField(
                key: const ValueKey('password'),
                controller: passwordController,
                obscureText: obscurePassword,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: Color(0xFF979797)),
                  ),

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSurffixIcon(
                    svgIcon: "assets/icons/eye.svg",
                    /*  onPressed: () {
                      setState(() {
                        obscurePassword=!obscurePassword;
                    })}; */
                  ),
                ),
              ),
              FormError(
                  errors: errors
                      .where((error) => error == kPassNullError)
                      .toList()),
            ],
          ),

          const SizedBox(height: 1),

          const SizedBox(height: 50),
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
                      //Get.offAll(SignInScreen());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid email or password'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  });

                  // Do something with the values

                  KeyboardUtil.hideKeyboard(context);
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
          const SizedBox(height: 20),

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
