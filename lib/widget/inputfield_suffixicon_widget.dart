import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_gym/constant/theme_color.dart';

class InputFieldSuffixIcon extends StatefulWidget {
  String? initialValue;
  String? hintText;
  String? labelText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool isPassword;
  bool? check;
  int? maxLines;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  String? Function(String?)? validate;
  InputFieldSuffixIcon({
    Key? key,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.onChanged,
    this.validate,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = true,
    this.maxLines,
  }) : super(key: key);

  @override
  _InputFieldSuffixIconState createState() => _InputFieldSuffixIconState();
}

class _InputFieldSuffixIconState extends State<InputFieldSuffixIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 5,
            offset: Offset(0,-0.2),
            color: Colors.grey.withOpacity(0.1),)
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          obscureText: widget.isPassword,
          initialValue: widget.initialValue,
          decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              prefixIcon: widget.prefixIcon,
              errorStyle: TextStyle(fontSize: 15),
              suffixIcon: widget.suffixIcon,
              labelStyle: TextStyle(color: Colors.blue,fontSize: 19,fontWeight: FontWeight.bold),
              filled: true,
              fillColor: Colors.white,
              focusedBorder:InputBorder.none,
              enabledBorder: InputBorder.none,
              border:InputBorder.none,
            // errorText: Colors.red,
          ),
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          validator: widget.validate,
          maxLines: widget.maxLines ?? 1,
        ),
      ),
    );
  }
  OutlineInputBorder outlineInputBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:BorderSide.none,
      gapPadding: 10,
    );
  }
}
