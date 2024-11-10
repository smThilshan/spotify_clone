import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final logoSize = screenWidth * 0.2; // 30% of screen width

    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.00, horizontal: screenWidth * 0.00),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.introBg), fit: BoxFit.cover)),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        AppVectors.logo,
                        width: logoSize,
                        height: logoSize,
                      )),
                  // Spacer(),
                  SizedBox(height: screenHeight * 0.5),

                  const Text(
                    "Enjoy Listening To Music",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  BasicAppButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ChooseModeScreen()));
                      },
                      title: "Get Started")
                ],
              ),
            ),
          ),
          // Container(
          //   color: Colors.black.withOpacity(0.3),
          // )
        ],
      ),
    );
  }
}
