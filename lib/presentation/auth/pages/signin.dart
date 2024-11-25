import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';
import 'package:spotify/presentation/root/pages/root.dart';
import 'package:spotify/service_locator.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _registerText(),
              const SizedBox(height: 50),
              _nameUsernameField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
                        email: _email.text.toString(),
                        password: _password.text.toString(),
                      ),
                    );

                    result.fold((ifLeft) {
                      var snackbar = SnackBar(
                        content: Text(ifLeft),
                        behavior: SnackBarBehavior.floating,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }, (ifRight) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => RootScreen()),
                          (route) => false);
                      var snackbar = SnackBar(content: Text(ifRight));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    });
                  },
                  title: "Sign In")
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Sign In",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _nameUsernameField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: "Enter Username Or Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: "Enter Password")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not A Member?",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignupScreen()));
              },
              child: const Text("Register Now"))
        ],
      ),
    );
  }
}
