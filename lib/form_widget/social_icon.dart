import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String svgImage;
  void Function()? onTap;
  SocialIcon({Key? key, required this.svgImage,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        padding: EdgeInsets.all(10),
        width: 60,
        height: 60,
        decoration:const BoxDecoration(
          color: Color(0xfff5f6f9),
          shape: BoxShape.circle,
        ),
        // child: SvgPicture.asset(svgImage),
      ),
    );
  }
}
