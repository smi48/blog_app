import 'dart:convert';
import 'package:blog_app/provider/appstate.dart';
import 'package:http/http.dart' as http;
import 'package:blog_app/constans/styles/colors_const.dart';
import 'package:blog_app/screens/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/big_button.dart';
import '../../components/text_input.dart';
import '../../constans/api/api_constants.dart';
import '../../utility/show_error_message.dart';
import '../../services/context/global_context.dart';
import '../../utility/snackbar.dart';
import '../tabs/tab_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(),
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
                buildTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    height: screenHeight,
                    hint: "Email",
                    controller: emailController,
                    obscureText: false),
                buildTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    height: screenHeight,
                    hint: "Password",
                    controller: passwordController,
                    obscureText: true),
                SizedBox(
                  height: screenHeight * 16 / 844,
                ),
                buildBigButton(
                  style: ButtonStyleEnum.dark,
                  icon: Icons.login_rounded,
                  screenHeight: screenHeight,
                  title: "Login",
                  onPressed: () => signIn(),
                ),
                buildBigButton(
                    style: ButtonStyleEnum.light,
                    icon: Icons.login_rounded,
                    screenHeight: screenHeight,
                    title: "Register",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    }),
                SizedBox(
                  height: screenHeight * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var token = prefs.getString("token");
      var jsonData;
      var response = await http.post(
          Uri.parse("http://test20.internative.net/Login/SignIn"),
          body: jsonEncode({
            "Email": emailController.text.trim(),
            "Password": passwordController.text.trim(),
          }),
          headers: ApiEnums.postSignIn.header(token: token));

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        jsonData = json.decode(response.body);

        var app = Provider.of<AppState>(context, listen: false);

        await app.setTokenToDevice(token: jsonData["Data"]["Token"]);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TabRouter()));
      } else {
        showMessage(
            context: NavigationService.navigatorKey.currentState!,
            resBody: response.body,
            color: BlogAppColors.errorColor);
      }
    } else {
      showSnackBar(context, "Geçersiz Bilgiler",
          backgroundColor: BlogAppColors.errorColor);
    }
  }
}
