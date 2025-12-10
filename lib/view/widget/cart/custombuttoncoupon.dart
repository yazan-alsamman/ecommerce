import 'package:flutter/material.dart';
import 'package:tataboq_app/core/constant/color.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
