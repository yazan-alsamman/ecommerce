import 'package:flutter/material.dart';
import 'package:tataboq_app/core/constant/color.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final Function() onTap;
  const CustomTextSignUpOrSignIn(
      {super.key, required this.texttwo, required this.textone, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
