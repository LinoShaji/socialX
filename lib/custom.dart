import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Widget widget;

  const CustomButton({Key? key, required this.color, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          color:
              color, // custom colour to be called where the widget has been called
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: widget,
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget widget;
  const CustomContainer({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: widget,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String HelperText;
  final Widget icon;
  final TextEditingController controller;
  final String label;

  const CustomTextField({
    Key? key,
    required this.HelperText,
    required this.icon,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          hintText: HelperText,
          suffixIcon: icon,
        ),
      ),
    );
  }
}
