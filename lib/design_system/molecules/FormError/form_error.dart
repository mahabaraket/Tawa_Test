import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Text(error,
            style: const TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}
