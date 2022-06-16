import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:none/Ui/Shared/shared_Style.dart';
import 'package:none/Ui/Shared/ui_helper.dart';

class buttonWidget extends StatelessWidget{

  final String title;
  final Function onPressedFunction;
  final Color bgColor;
  const buttonWidget({
    Key? key ,required this.title,required this.onPressedFunction,required this.bgColor
}):super (key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      padding: fieldPadding,
      width: screenPercentWidhth(context,multipleBy: 0.9),
      child: RaisedButton(
        color: bgColor,
        onPressed: onPressedFunction(),
        child: Text(
          '$title',
          style: textButtonTxtStyle,
        ),
      ),
    );
  }
}