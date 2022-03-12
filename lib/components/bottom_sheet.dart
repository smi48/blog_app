import 'package:flutter/material.dart';

import 'package:blog_app/constans/styles/text_styles_const.dart';

import '../constans/styles/colors_const.dart';
import 'big_button.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);
  final double screenWidth;
  final double screenHeight;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  var isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: BlogAppColors.appBarBg,
      ),
      padding: const EdgeInsets.all(16),
      width: widget.screenWidth,
      height: widget.screenHeight * 600 / 844,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Expanded(
            child: Stack(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: BlogAppColors.iconPassive,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: 56,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isPressed,
                child: Positioned(
                  top: 4,
                  left: widget.screenWidth * 36 / 390,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: widget.screenWidth * 286 / 390,
                    height: widget.screenHeight * 211 / 844,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: BlogAppColors.appBarBg,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Select a Picture",
                              style: BlogAppTextStyles.buttonText
                                  .copyWith(color: BlogAppColors.iconActive),
                            ),
                          ),
                        ),
                        buildBigButton(
                            screenHeight: widget.screenHeight,
                            icon: Icons.camera_alt_rounded,
                            title: "Camera",
                            style: ButtonStyleEnum.dark,
                            onPressed: () {}),
                        buildBigButton(
                            screenHeight: widget.screenHeight,
                            icon: Icons.browse_gallery_rounded,
                            title: "Gallery",
                            style: ButtonStyleEnum.light,
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: buildBigButton(
                      screenHeight: widget.screenHeight,
                      icon: Icons.logout_rounded,
                      title: "Select",
                      style: ButtonStyleEnum.dark,
                      onPressed: () {}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: buildBigButton(
                      screenHeight: widget.screenHeight,
                      icon: Icons.logout_rounded,
                      title: "Remove",
                      style: ButtonStyleEnum.light,
                      onPressed: () {}),
                )
              ],
            ),
          ),
          SizedBox(
            height: widget.screenHeight * 91 / 844,
          ),
        ],
      ),
    );
  }
}

// Container buildBottomSheet(double screenWidth, double screenHeight) {
//   bool isPressed = false;
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(16),
//       color: BlogAppColors.appBarBg,
//     ),
//     padding: const EdgeInsets.all(16),
//     width: screenWidth,
//     height: screenHeight * 600 / 844,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Expanded(
//           child: Stack(children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: BlogAppColors.iconPassive,
//               ),
//               child: Center(
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.camera_alt,
//                     size: 56,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: isPressed,
//               child: Positioned(
//                 top: 4,
//                 left: screenWidth * 36 / 390,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   width: screenWidth * 286 / 390,
//                   height: screenHeight * 211 / 844,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     color: BlogAppColors.appBarBg,
//                   ),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Center(
//                           child: Text(
//                             "Select a Picture",
//                             style: BlogAppTextStyles.buttonText
//                                 .copyWith(color: BlogAppColors.iconActive),
//                           ),
//                         ),
//                       ),
//                       buildBigButton(
//                           screenHeight: screenHeight,
//                           icon: Icons.camera_alt_rounded,
//                           title: "Camera",
//                           style: ButtonStyleEnum.dark,
//                           onPressed: () {}),
//                       buildBigButton(
//                           screenHeight: screenHeight,
//                           icon: Icons.browse_gallery_rounded,
//                           title: "Gallery",
//                           style: ButtonStyleEnum.light,
//                           onPressed: () {}),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ]),
//         ),
//         SizedBox(
//           height: 70,
//           child: Row(
//             children: [
//               Expanded(
//                 child: buildBigButton(
//                     screenHeight: screenHeight,
//                     icon: Icons.logout_rounded,
//                     title: "Select",
//                     style: ButtonStyleEnum.dark,
//                     onPressed: () {}),
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: buildBigButton(
//                     screenHeight: screenHeight,
//                     icon: Icons.logout_rounded,
//                     title: "Remove",
//                     style: ButtonStyleEnum.light,
//                     onPressed: () {}),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: screenHeight * 91 / 844,
//         ),
//       ],
//     ),
//   );
// }
