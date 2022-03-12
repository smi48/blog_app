import 'package:blog_app/components/big_button.dart';
import 'package:blog_app/constans/styles/colors_const.dart';
import 'package:blog_app/screens/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/bottom_sheet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: BlogAppColors.iconPassive,
                      radius: (screenWidth * 174 / 390) / 2,
                    ),
                    Positioned(
                        bottom: screenWidth * 29 / 450,
                        right: screenWidth * 29 / 450,
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 36,
                          ),
                          onPressed: () {
                            showModalBottomSheet<dynamic>(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => BottomSheetWidget(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                    ));
                          },
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                width: screenWidth,
                height: screenHeight * 174 / 844,
                decoration: BoxDecoration(
                  color: BlogAppColors.iconPassive,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              buildBigButton(
                  screenHeight: screenHeight,
                  icon: Icons.logout_rounded,
                  title: "Save",
                  style: ButtonStyleEnum.light,
                  onPressed: () {}),
              buildBigButton(
                  screenHeight: screenHeight,
                  icon: Icons.logout_rounded,
                  title: "Log Out",
                  style: ButtonStyleEnum.dark,
                  onPressed: () => logOut(context)),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    token != null
        ? {
            await prefs.remove("token"),
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false),
          }
        : Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false);
  }
}
