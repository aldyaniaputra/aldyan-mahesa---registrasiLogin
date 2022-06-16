import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:none/Ui/Models/SignUpViewModel.dart';
import 'package:none/Ui/Shared/shared_Style.dart';
import 'package:none/Ui/Shared/ui_helper.dart';

class formImage extends StatelessWidget{
  SignUpViewModel model;
  formImage({required this.model});
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: model.busy
        , child: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Foto KTP",
                  style: homeNameTxtStyle.copyWith(fontSize: 17),
                ),
                verticalSpaceTiny,
                InkWell(
                  onTap: () async {
                    await model.cameraView("KTP");
                  },
                  child: Container(
                    padding: fieldPadding,
                    width: screenPercentWidhth(context, multipleBy: 0.83),
                    height: screenPercentHeight(context, multipleBy: 0.25),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.greenAccent,
                          width: 2.0
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: model.isPathNull("KTP") == false
                        ? Center(
                        child: Text(
                          "Upload KTP/ID Card",
                          style: textButtonTxtStyle,
                        )
                    ) : Image.file(File(model.imagePath), fit: BoxFit.cover,),
                  ),
                ),
                verticalSpaceMedium,
                Text(
                  "Foto Profile",
                  style: homeNameTxtStyle.copyWith(fontSize: 17),
                ),
                verticalSpaceTiny,
                InkWell(
                  onTap: () async {
                    await model.cameraView("Profile");
                  },
                  child: Container(
                    padding: fieldPadding,
                    width: screenPercentWidhth(context, multipleBy: 0.83),
                    height: screenPercentHeight(context, multipleBy: 0.25),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.greenAccent,
                          width: 2.0
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: model.isPathNull("Profile") == false
                        ? Center(
                        child: Text(
                          "Upload Foto Profile",
                          style: textButtonTxtStyle,
                        )
                    ) : Image.file(File(model.imagePathProfile,), fit: BoxFit.cover,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}