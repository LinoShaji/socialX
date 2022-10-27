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

class CustomContainer extends StatefulWidget {
  final Widget widget;
  final double height;
  const CustomContainer({Key? key, required this.widget, required this.height})
      : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: widget.widget,
    );
  }
}

class CustomTextField extends StatefulWidget {
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        obscureText: widget.isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
          labelStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          hintText: widget.HelperText,
          suffixIcon: widget.icon,
        ),
      ),
    );
  }
}
