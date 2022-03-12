import 'dart:convert';
import 'package:blog_app/components/text_input.dart';
import 'package:blog_app/screens/auth/login_page.dart';
import 'package:blog_app/screens/tabs/tab_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/big_button.dart';
import '../../constans/api/api_constants.dart';
import '../../constans/styles/colors_const.dart';
import 'package:http/http.dart' as http;
import '../../utility/show_error_message.dart';
import '../../services/context/global_context.dart';
import '../../utility/snackbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

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
            key: formKey,
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
                buildTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    height: screenHeight,
                    hint: "Re-Password",
                    controller: rePasswordController,
                    obscureText: true),
                SizedBox(
                  height: screenHeight * 16 / 844,
                ),
                buildBigButton(
                    style: ButtonStyleEnum.dark,
                    icon: Icons.login_rounded,
                    screenHeight: screenHeight,
                    title: "Register",
                    onPressed: () => signUp()),
                buildBigButton(
                    style: ButtonStyleEnum.light,
                    icon: Icons.login_rounded,
                    screenHeight: screenHeight,
                    title: "Login",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    }),
                SizedBox(
                  height: screenHeight * 0.2,
                ),
              ],
            ))),
      ),
    );
  }

  Future<void> signUp() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var token = prefs.getString("token");
      var jsonData;
      var response = await http.post(
          Uri.parse("http://test20.internative.net/Login/SignUp"),
          body: jsonEncode({
            "Email": emailController.text.trim(),
            "Password": passwordController.text.trim(),
            "PasswordRetry": rePasswordController.text.trim(),
          }),
          headers: ApiEnums.postSignUp.header(token: token));

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        jsonData = json.decode(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", jsonData["Data"]["Token"]);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TabRouter()));
      } else {
        showMessage(
            context: NavigationService.navigatorKey.currentState!,
            resBody: jsonData.body,
            color: BlogAppColors.errorColor);
      }
    } else {
      showSnackBar(context, "Geçersiz Bilgiler",
          backgroundColor: BlogAppColors.errorColor);
    }
  }
}
