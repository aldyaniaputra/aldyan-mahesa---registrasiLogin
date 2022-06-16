import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:none/Constant.dart';
import 'package:none/Ui/Shared/shared_Style.dart';
import 'package:none/Ui/Shared/ui_helper.dart';
import 'package:none/Ui/Models/loginViewModel.dart';
import 'package:none/Ui/View/signUpView.dart';
import 'package:none/Ui/wiget/button_Widget.dart';
import 'package:none/Ui/wiget/txtField_widget.dart';
import 'package:stacked/stacked.dart';

class loginViewWidget extends StatelessWidget{
  const loginViewWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<loginViewModel>.reactive(
        builder: (context,model,child) => Scaffold(
          body: LoadingOverlay(
            isLoading: model.busy,
            child: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      verticalSpaceMedium,
                      Text('Test Login',style: TitleTxtStyle,),
                      verticalSpaceTiny,
                      Image.asset('assets/logo.jpg',width: size.width*0.3,height: size.height *0.3,),
                      verticalSpaceMedium,
                      textFieldWidget(
                          hintText: 'E-Mail',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          controller: null,
                          isPassword: false,
                          colorIcon: color_main
                      ),
                      verticalSpaceTiny,
                      textFieldWidget(
                          hintText: 'Password',
                          icon: Icons.lock,
                          keyboardType: TextInputType.emailAddress,
                          controller: null,
                          isPassword: true,
                          colorIcon: color_main
                      ),
                      verticalSpaceLarge,
                      buttonWidget(
                          title: 'Login',
                          onPressedFunction: (){},
                          bgColor: color_main
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text ('Tidak Memiliki aKun? '),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => signUpView())
                              );
                            },
                            child: Text(
                              'daftar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                color: color_main,
                              ),
                            ),
                          )
                        ],
                      ),
                      verticalSpaceLarge
                    ],
                  ),

                ),
              ),
            ),
          ),
        ),
        viewModelBuilder: () => loginViewModel()
    );
  }
}