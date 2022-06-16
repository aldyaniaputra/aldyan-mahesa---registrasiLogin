import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:none/Ui/Models/SignUpViewModel.dart';
import 'package:none/Ui/View/loginViewWidget.dart';
import 'package:none/Ui/wiget/signUp/formLocation.dart';
import 'package:none/Ui/wiget/signUp/formPersonalData.dart';
import 'package:none/Ui/wiget/signUp/form_Image.dart';
import 'package:stacked/stacked.dart';

class signUpView extends StatefulWidget{
  @override
  signUpViewState createState() => signUpViewState();
}
class signUpViewState extends State<signUpView>{
  int _currentStep = 0;
  VoidCallback? _onStepContinue;
  VoidCallback? _onStepCancel;
  void onStepContinueVoid(){
    if (_currentStep < 2){
      _currentStep += 1;
    }
  }
  void onStepCancelVoid(){
    _currentStep -= 1;
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      onModelReady: (model) => model.initState(),
      builder: (context,model,child) => Scaffold(
        appBar: AppBar(
          title: new Text(
              'Sign up',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => loginViewWidget()) );
            },
          ),
          elevation: 0,
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: LoadingOverlay(
          isLoading: model.busy,
          child: Column(
            children: [
              Expanded(
                  child: Theme(
                    data: ThemeData(primarySwatch: Colors.orange),
                    child: Stepper(
                      type: StepperType.horizontal,
                      currentStep: _currentStep,

                      controlsBuilder: (BuildContext context,cdr,) {

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: TextButton(
                                  onPressed: onStepCancelVoid,
                                  child: const Text('BACK'),
                                )
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: onStepContinueVoid,
                                child: const Text('NEXT'),
                              ),
                            ),
                          ],
                        );
                      },
                      onStepTapped: (int step) =>
                          setState(() => _currentStep = step),
                      onStepContinue: _currentStep < 2
                          ? () => setState(() => _onStepContinue = onStepContinueVoid)
                          : _onStepContinue = null,
                      onStepCancel: _currentStep > 0
                          ? () => _onStepCancel = onStepContinueVoid
                          : null,
                      steps: <Step>[
                        new Step(
                            title: const Text('Personal'),
                            content: formPersonal(model: model),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 0
                                ? StepState.complete
                                : StepState.disabled
                        ),
                        new Step(
                            title: const Text('Image'),
                            content: formImage(model: model,),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 1
                                ? StepState.complete
                                : StepState.disabled
                        ),
                        new Step(
                            title: const Text('Location'),
                            content: formLocation(model: model,),
                            isActive: _currentStep >= 0,
                            state: _currentStep >= 2
                                ? StepState.complete
                                : StepState.disabled
                        ),
                      ],
                    ),
                  )
              ),(_currentStep >= 2) ? Container(
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('sign Up'),
                ),
                width: size.width,
              ):Container(),
            ],
          ),
        ),
      ),
    );
  }
}