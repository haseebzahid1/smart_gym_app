
import 'package:flutter/cupertino.dart';



class FormProvider extends ChangeNotifier{

  /// form start
  String userEmail = "";
  String password = "";
  String confirmPassword = "";
  /// form End
  /// Form provider Start
  bool remember = false;



  void onSaveUsername(String? value){
    userEmail = value ?? "";
  }

  void onSavedPassword  (String? value) {
    password = value ?? "";
    // print (password);
  }

  void onSaveConfirmPassword(String? value){
    confirmPassword = value ?? "";
  }

  void onChancedPassword  (String value) {
    password = value;
  }
  void onChangedConfirmPassword  (String value) {
    confirmPassword = value;
  }

  String? validateUsername(String? value){
    userEmail = value ?? "";
    if(value==null || value.isEmpty){
      return "please enter your user Email";
    }else if(value.length<3 ){
      return "Email length must be 3 or long";
    }else{
      return null;
    }
  }

  String? validatePassword(String? value){
    password = value!;
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }else if(value.length<3){
      return "Passwrod length must be 3 character or long";
    } else if(value.length>16){
      return "Password length must be 16 character or less";
    }else {
      return null;
    }
  }

  String? validateConfirmPassword(String? value){
    confirmPassword = value ?? "";
    if(value==null  || value.isEmpty){
      return "Confirm password is required";
    }
    else if(value.length<3){
      return "password must 3 charactor or long";
    }else if(value.length>16) {
      return "Password length must be 16 character or less";
    } else if(password != confirmPassword){
      return "password not match";
    }

    return null;
  }

  void onSubmit(){
    print({"${userEmail}, ${password}, $confirmPassword"});
  }
/// Form provider End
}
