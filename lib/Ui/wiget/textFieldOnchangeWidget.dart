import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:none/Ui/Shared/shared_Style.dart';
import 'package:none/Ui/Shared/ui_helper.dart';
import 'package:none/Constant.dart';

class txtFieldOnChangeWidget extends StatelessWidget{final String hintText;
final IconData icon;
final Function OnChangeFunction;
final TextInputType keyboardType;
final bool isPassword;
final Color colorIcon;
const txtFieldOnChangeWidget({
  Key? key,
  required this.hintText,
  required this.icon,
  required this.OnChangeFunction,
  required this.keyboardType,
  required this.isPassword,
  required this.colorIcon,
}) :super(key :key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: fieldPadding,
      width: screenPercentWidhth(context , multipleBy: 1),
      height: fieldHeight,
      child: TextFormField(
        obscureText: isPassword,
        onChanged: OnChangeFunction(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blue,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,color: color_main),
          ),
        ),
      ),
    );
  }
}