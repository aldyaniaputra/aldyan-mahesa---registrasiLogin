import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:none/Ui/Shared/shared_Style.dart';
import 'package:none/Ui/Shared/ui_helper.dart';
import 'package:none/Constant.dart';

class textFieldWidget extends StatelessWidget{
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool isPassword;
  final Color colorIcon;

  const textFieldWidget({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.keyboardType,
    required this.controller,
    required this.isPassword,
    required this.colorIcon,
  }) :super(key :key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: fieldPadding,
      width: screenPercentWidhth(context , multipleBy: 0.9),
      height: fieldHeight,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(width: 1,color: color_main),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}