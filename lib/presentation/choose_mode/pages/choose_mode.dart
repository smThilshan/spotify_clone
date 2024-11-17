import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';

import '../../../core/config/theme/app_colors.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final logoSize = screenWidth * 0.2; // 30% of screen width

    return SafeArea(
      child: Stack(
        children: [
          //  Background image part

          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppImages.chooseMode,
                    ))),
          ),

          // Adjust the dark and light

          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          // Content Part

          Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.025,
                horizontal: screenHeight * 0.025),
            child: Column(
              children: [
                // SizedBox(height: screenHeight * 0.01),
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      AppVectors.logo,
                      width: logoSize,
                      height: logoSize,
                    )),
                const Spacer(),
                // SizedBox(height: screenHeight * 0.5),

                const Text(
                  "Choose Mode",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff30393c).withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                AppVectors.moon,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Dark Mode",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: AppColors.grey,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff30393c).withOpacity(0.5),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                AppVectors.sun,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Light Mode",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: AppColors.grey,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ChooseModeScreen()));
                    },
                    title: "Continue")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
