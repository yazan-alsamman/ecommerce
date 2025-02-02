// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tataboq_app/core/constant/color.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String textbutton;
  final IconData icondata;

  final bool? active;
  const CustomButtonAppBar({
    super.key,
    required this.onPressed,
    required this.textbutton,
    required this.icondata,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icondata,
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
          // Text(
          //   textbutton,
          //   style: TextStyle(
          //       color: active == true ? AppColor.primaryColor : AppColor.grey2),
          // ),
        ],
      ),
    );
  }
}
