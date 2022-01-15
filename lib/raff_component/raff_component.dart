import 'package:flutter/material.dart';
import 'package:flutter_smart_gym/form_widget/social_icon.dart';

class Raff extends StatelessWidget {
  const Raff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialIcon(svgImage: 'assets/icons/google-icon.svg',onTap: (){},),
            SocialIcon(svgImage: 'assets/icons/facebook-2.svg',onTap: (){},),
            SocialIcon(svgImage: 'assets/icons/twitter.svg',onTap: (){},),
          ],
        ),
      ],
    );
  }
}
