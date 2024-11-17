import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            SizedBox(
              height: 10,
            ),
            _fullNameField(),
          ],
        ),
      ),
    );
  }
}

Widget _registerText() {
  return Text(
    "Register",
    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}

Widget _fullNameField() {
  return TextField();
}
