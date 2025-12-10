import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/imageasset.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imagename;
  final String title;
  final bool isActive;
  const CardDeliveryTypeCheckout(
      {super.key,
      required this.imagename,
      required this.title,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.secondColor : null,
          border: Border.all(color: AppColor.secondColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            width: 60,
            color: isActive ? Colors.white : null,
          ),
          Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : AppColor.secondColor,
                fontWeight: isActive ? FontWeight.bold : null),
          ),
        ],
      ),
    );
  }
}
