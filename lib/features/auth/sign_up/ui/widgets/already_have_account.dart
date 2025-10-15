import 'package:eshop/core/extentions/extentions.dart';
import 'package:eshop/core/routes/my_routes.dart';
import 'package:eshop/core/themes/my_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account ? ',
              style: MyTextStyle.font14w400Black,
            ),
            TextSpan(
              text: 'Login',
              style: MyTextStyle.font14w400Grey,
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.pushNamed(MyRoutes.login),
            ),
          ],
        ),
      ),
    );
  }
}
