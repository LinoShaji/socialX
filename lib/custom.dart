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
  final double height;
  const CustomContainer({Key? key, required this.widget, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
  bool isObscure = true;

  CustomTextField({
    Key? key,
    required this.HelperText,
    required this.icon,
    required this.controller,
    required this.label,
    required this.isObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        obscureText: isObscure,
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
