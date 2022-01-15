import 'package:flutter/material.dart';


class InputFieldWidget extends StatefulWidget {
  String? initialValue;
  String? hintText;
  String? labelText;
  Widget? prefixIcon;
  int? maxLines;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  String? Function(String?)? validate;

  InputFieldWidget({Key? key,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.onChanged,
    this.validate,
    this.prefixIcon,
    this.maxLines,
  }) : super(key: key);

  @override
  _InputFieldWidgetState createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:widget.initialValue,
      decoration:  InputDecoration(
        hintText:widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
      ),
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: widget.validate,
      maxLines: widget.maxLines ?? 1,
    );
  }

}
