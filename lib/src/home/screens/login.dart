
import 'package:flutter/material.dart';
import 'package:investor/vcui/lib/vui/ui_components/buttons.dart';
import 'package:investor/vcui/lib/vui/ui_components/bottom_model_sheet.dart';
import 'package:investor/vcui/lib/vui/ui_components/snackbar.dart';
import 'package:investor/vcui/lib/vui/ui_components/labels.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginIdController = TextEditingController();
  String errorMessage = "";

  void validate(){
    if(loginIdController.text == ""){
      setState(() {
        errorMessage = "Please enter login id";
      });
    }
    else if(loginIdController.text != "ajay@gmail.com"){
      setState(() {
        errorMessage = "Invalid login id";
      });
      ToastMessage.errorSnackBar(context, "Invalid login id");
    }
    else{
      setState(() {
        errorMessage = "";
      });
      ToastMessage.snackBarMessage(context, "Login Successfully");
      Navigator.pushNamed(context, "/overview");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              controller: loginIdController,
              decoration: const InputDecoration(
                counterText: '',
                hintText: "Enter login id",
              ),
            ),
            const SizedBox(height: 5),

            highRiskLabel(errorMessage),
            const SizedBox(height: 30),

            fullWidthButton(
              "Login",
              validate,
              350.0,
            ),
            const SizedBox(height: 30),

            textButton("Terms and Conditions", (){
              bottomSheet(
                context,
                title: "Terms and Conditions",
                message: "Terms",
                isCloseButton: true,
                modelSheetRadius: 10.0,
              );
            }),
          ],
        ),
      ),
    );
  }
}
