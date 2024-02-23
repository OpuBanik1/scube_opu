import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonItem extends StatelessWidget {
  ButtonItem({super.key, this.title, this.icon, this.clr, this.ontap});
  String? title;
  IconData? icon;
  VoidCallback? ontap;
  Color? clr;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.only(bottom: 20),
      onPressed: ontap,
      child: Row(
        children: [
          Icon(icon, color: clr),
          const SizedBox(
            width: 20,
          ),
          Text(
            "$title",
            style: TextStyle(color: clr),
          ),
        ],
      ),
    );
  }
}
