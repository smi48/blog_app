import 'package:blog_app/components/text_input.dart';
import 'package:flutter/material.dart';

import '../../components/big_button.dart';
import '../../constans/styles/colors_const.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 32 / 844,
                  bottom: screenHeight * 16 / 844),
              width: screenWidth * 174 / 390,
              height: screenWidth * 174 / 390,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: BlogAppColors.iconPassive),
            ),
            buildTextFormField(height: screenHeight, hint: "Email"),
            buildTextFormField(height: screenHeight, hint: "Password"),
            buildTextFormField(height: screenHeight, hint: "Re-Password"),
            SizedBox(
              height: screenHeight * 16 / 844,
            ),
            buildBigButton(
                style: ButtonStyleEnum.dark,
                icon: Icons.login_rounded,
                screenHeight: screenHeight,
                title: "Register",
                onPressed: () {}),
            buildBigButton(
                style: ButtonStyleEnum.light,
                icon: Icons.login_rounded,
                screenHeight: screenHeight,
                title: "Login",
                onPressed: () {}),
            SizedBox(
              height: screenHeight * 0.2,
            ),
          ],
        ))),
      ),
    );
  }
}
