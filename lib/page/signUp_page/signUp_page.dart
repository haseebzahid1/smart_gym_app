import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter_smart_gym/constant/theme_color.dart';
import 'package:flutter_smart_gym/page/signUp_page/sign-up_provider.dart';
import 'package:flutter_smart_gym/widget/double_line.dart';
import 'package:flutter_smart_gym/widget/form_button.dart';
import 'package:flutter_smart_gym/widget/input_field.dart';

import 'package:flutter_smart_gym/widget/social_icon.dart';
import 'package:flutter_smart_gym/page/signIn_page/sign_in_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(
      create: (context)=>SignUpProvider(),
    child: HomePageWidget(),);
  }
}

class HomePageWidget extends StatelessWidget {
   HomePageWidget({Key? key}) : super(key: key);
   final TapGestureRecognizer gestureTermsCondition = TapGestureRecognizer()..onTap = (){
     print("Terms & Conditions");
   }; final TapGestureRecognizer gesturePrivacyPolicy = TapGestureRecognizer()..onTap = (){
     print("Privacy Policy");
   };
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   final signUpProvider = Provider.of<SignUpProvider>(context);
    final Size size  = MediaQuery.of(context).size;
    return Container(
      decoration:  const BoxDecoration(
        color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),fit: BoxFit.fill
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: (){
           FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(36, 0, 36, 0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        IconButton(onPressed:(){
                          Navigator.of(context).pop();
                        }, icon: Icon(Icons.arrow_back), iconSize: 44,),
                        // SizedBox(height: 10,),
                        Image.asset("assets/images/logo.png",height: size.height * 0.10,),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Register with socials",style: registerHeadingStyle ,),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SocialIcon(bgColor:bgButtonWhite, svgImage: 'assets/icons/google-icon.svg',onTap: (){ print("google");},),
                              SocialIcon(bgColor:kbgBlue,color: Colors.white, svgImage: 'assets/icons/facebook-2.svg',onTap: (){print("facebook");},),
                              SocialIcon(bgColor:lightBlue,color: Colors.white, svgImage: 'assets/icons/twitter.svg',onTap: (){print("twitter");},),
                            ],
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(height: 6,),
                    DoubleLine(),
                    // const SizedBox(height: 6,),
                    Row(
                      children:  [
                        Text("Register with email",style:  registerHeadingStyle,),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          InputFieldWidget(
                            initialValue: signUpProvider.signUpUser.email ?? "Email@gmail.com",
                            hintText: "Email@gmail.com",
                            labelText: "Email",
                            textInputType:TextInputType.emailAddress,
                            validate:signUpProvider.validateUsername,
                            onSaved: signUpProvider.onSaveUsername,
                            prefixIcon: const Icon(Icons.person,color: lightBlue,),
                            isPassword: false,
                          ),
                          const SizedBox(height: 18,),
                          InputFieldWidget(
                            initialValue: signUpProvider.signUpUser.password ?? "12345678",
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.https,color: lightBlue,),
                            validate:signUpProvider.validatePassword,
                            onSaved: signUpProvider.onSavedPassword,
                            onChanged:signUpProvider.onChancedPassword ,
                          ),const SizedBox(height: 15,),
                          InputFieldWidget(
                            initialValue: "12345678",
                            labelText: "Confirm Password",
                            prefixIcon: const Icon(Icons.https,color: lightBlue,),
                            validate:signUpProvider.validateConfirmPassword,
                            onChanged: signUpProvider.onChangedConfirmPassword,
                            onSaved:signUpProvider.onSaveConfirmPassword,
                          ),
                          const SizedBox(height: 7,),
                          Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: 'Bt creating an account I accept the ',style: privacyHeadingStyle),
                                  TextSpan(text: 'Terms & Conditions', style: privacyHeadingStyle.copyWith(color: Colors.blue),recognizer: gestureTermsCondition),
                                  TextSpan(text: 'and',style: privacyHeadingStyle),
                                  TextSpan(text: 'privacy policy',style: privacyHeadingStyle.copyWith(color: Colors.blue),recognizer: gesturePrivacyPolicy),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          FormButton(
                            onTap: (){
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                signUpProvider.onSubmit();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("VaLIDATION PASSED"))
                                );
                              }else{
                                signUpProvider.onSubmit();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("VALIDATION ERROR")));
                              }
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                            },
                            padding:EdgeInsets.symmetric(vertical: 13) ,
                            bgcolor: lightBlue, color: Colors.white,
                            width: double.infinity, textButton: 'Join Us',),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already a member?",
                          style: memberHeadingStyle,
                        ),
                        const SizedBox(width: 3,),
                        InkWell(
                          // onTap: onTab,
                          onTap: (){},
                          child:  Text("Sign in",
                            style: memberHeadingStyle.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


