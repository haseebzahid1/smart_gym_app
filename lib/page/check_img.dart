import 'package:flutter/material.dart';

class CheckImg extends StatelessWidget {
  const CheckImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Container(
      height: size.height, decoration:  BoxDecoration(
        color: Colors.purple,
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"),fit: BoxFit.cover
        )
    ),
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
