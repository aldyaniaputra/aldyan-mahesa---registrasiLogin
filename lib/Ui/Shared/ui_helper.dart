import 'package:flutter/cupertino.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0,);
const Widget horizontalSpaceMedium = SizedBox(width: 20.0,);
const Widget horizontalSpaceLarge = SizedBox(width: 30.0,);
const Widget verticalSpaceTiny = SizedBox(height: 5.0,);
const Widget verticalSpaceMedium = SizedBox(height: 20.0,);
const Widget verticalSpaceLarge = SizedBox(height: 30.0,);
const Widget verticalSpaceMassive = SizedBox(height: 50.0,);

double screenWidth(BuildContext ctx) => MediaQuery.of(ctx).size.width;
double screenHeight(BuildContext ctx) => MediaQuery.of(ctx).size.height;

double screenPercentWidhth(BuildContext ctx,{double multipleBy = 1}) => (screenWidth(ctx)*multipleBy);
double screenPercentHeight(BuildContext ctx ,{double multipleBy = 1}) => (screenHeight(ctx)*multipleBy);
