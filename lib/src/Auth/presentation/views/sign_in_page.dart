import 'package:flutter/material.dart';
import 'package:movie_app/src/Auth/presentation/widgets/custom_button.dart';
import 'package:movie_app/src/Auth/presentation/widgets/custom_text_fieldd.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(150, 0, 10, 90),
            width: 100,
            height: 100,
            child: Center(
              child: Icon(Icons.slow_motion_video_sharp, size: 100),
            ),
          ),
          const Text(
            "Login to your Account",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 17),
          const CustomTextFieldd(
            labelText: "Email",
          ),
          const SizedBox(height: 10),
          const CustomTextFieldd(
            labelText: "Password",
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: "Login",
            onPressed: () {
              print('Navigate to home page');
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
