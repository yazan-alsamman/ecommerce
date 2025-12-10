import 'package:flutter/material.dart';
import 'package:tataboq_app/core/constant/color.dart';

class CardShippingAdressChekout extends StatelessWidget {
  final String title;
  final String body;
  final bool isActive;
  const CardShippingAdressChekout(
      {super.key,
      required this.title,
      required this.body,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.secondColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : null,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(body,
            style: TextStyle(
                color: isActive ? Colors.white : null,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
