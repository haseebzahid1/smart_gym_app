
import 'package:flutter/cupertino.dart';



class SignInProvider extends ChangeNotifier{

  /// form start
  String userEmail = "";
  String password = "";
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


  void onChancedPassword  (String value) {
    password = value;
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



  void onSubmit(){
    print({"${userEmail}, ${password}"});
  }
/// Form provider End
}
