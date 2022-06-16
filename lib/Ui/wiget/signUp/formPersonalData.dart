import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:none/Constant.dart';
import 'package:none/Ui/Shared/shared_Style.dart';
import 'package:none/Ui/Shared/ui_helper.dart';
import 'package:none/Ui/Models/SignUpViewModel.dart';
import 'package:none/Ui/wiget/textFieldOnchangeWidget.dart';
import 'package:none/Ui/wiget/txtField_widget.dart';

class formPersonal extends StatefulWidget{
  SignUpViewModel model;
  @override
  formPersonalState createState() => formPersonalState();
  formPersonal({required this.model});
}
class formPersonalState extends State<formPersonal>{
  SignUpViewModel model = new SignUpViewModel();
  String valueDrop = '';
  @override
  void initState(){
    super.initState();
    model = widget.model;
  }
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: model.busy,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  verticalSpaceTiny,
                  textFieldWidget(
                      hintText: 'hintText',
                      icon: Icons.person,
                      keyboardType: TextInputType.text,
                      controller: null,
                      isPassword: false,
                      colorIcon: color_main
                  ),
                  verticalSpaceTiny,
                  textFieldWidget(
                      hintText: 'profesi/ jabatan',
                      icon: Icons.panorama_fish_eye,
                      keyboardType: TextInputType.text,
                      controller: null,
                      isPassword: false,
                      colorIcon: color_main
                  ),
                  verticalSpaceTiny,
                  textFieldWidget(
                      hintText: 'email',
                      icon: Icons.person,
                      keyboardType: TextInputType.text,
                      controller: null,
                      isPassword: false,
                      colorIcon: color_main
                  ),
                  verticalSpaceTiny,
                  textFieldWidget(
                      hintText: 'nomorIdentias(no ktp/nisn)',
                      icon: Icons.person,
                      keyboardType: TextInputType.text,
                      controller: null,
                      isPassword: false,
                      colorIcon: color_main
                  ),
                  verticalSpaceTiny,
                  textFieldWidget(
                      hintText: 'password',
                      icon: Icons.lock,
                      keyboardType: TextInputType.text,
                      controller: null,
                      isPassword: true,
                      colorIcon: color_main
                  ),
                  verticalSpaceTiny,
                  textFieldWidget(
                      hintText: 'no hp',
                      icon: Icons.phone,
                      keyboardType: TextInputType.text,
                      controller: null,
                      isPassword: false,
                      colorIcon: color_main
                  ),
                  verticalSpaceTiny,
                  txtFieldOnChangeWidget(
                      hintText: 'Registration Code',
                      icon: Icons.person,
                      OnChangeFunction: () {
                        /*model.units.clear();
                        if (valueDrop != null && valueDrop.toString().isNotEmpty){
                          model.company= valueDrop;
                          model.getCompanyUnit(valueDrop);
                        }*/
                      },
                      keyboardType: TextInputType.text,
                      isPassword: false,
                      colorIcon: color_main
                  ),
                  Visibility(
                    child: verticalSpaceTiny,
                    visible: model.ChangeVisibility(),
                  ),
                  Visibility(
                      child: Container(
                        padding: fieldPadding,
                        width: screenPercentWidhth(context,multipleBy: 0.9),
                        height: fieldHeight,
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text('couse unit '),
                          value: valueDrop,
                          items: model.units == null ? null : model.units.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value){
                            setState(() {
                              valueDrop = value.toString();
                              model.onUnitChangeSelected(value.toString());
                            });
                          },
                        ),
                      )
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}