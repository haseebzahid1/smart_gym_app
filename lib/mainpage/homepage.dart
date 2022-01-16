import "package:flutter/material.dart";
import 'package:flutter_smart_gym/form_widget/form_button.dart';
import 'package:flutter_smart_gym/form_widget/input_field.dart';
import 'package:flutter_smart_gym/form_widget/inputfield_suffixicon_widget.dart';
import 'package:flutter_smart_gym/form_widget/social_icon.dart';
import 'package:flutter_smart_gym/mainpage/provider.dart';
import 'package:flutter_smart_gym/page/login_page.dart';
import 'package:flutter_smart_gym/theme_color/theme_color.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormProvider>(
      create: (context)=>FormProvider(),
    child: HomePageWidget(),);
  }
}

class HomePageWidget extends StatelessWidget {
   HomePageWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   final formProvider = Provider.of<FormProvider>(context);
    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
            width: size.width,
            // height: size.height,
            decoration:  BoxDecoration(
                color: Colors.purple,
              image: DecorationImage(
                  image: AssetImage("assets/images/form img1.jpeg"),fit: BoxFit.cover

              )



            ),
            child: Column(
              children: [
                Column(
                  children: [
                    IconButton(onPressed:(){
                      Navigator.of(context).pop();
                    }, icon: Icon(Icons.arrow_back), iconSize: 44,),
                    SizedBox(height: 10,),
                    Image.asset("assets/images/logo.png"),
                  ],
                ),
                const SizedBox(height: 23,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Register with socials",style: registerHeadingStyle ,),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SocialIcon(bgColor:bgButtonWhite, svgImage: 'assets/icons/google-icon.svg',onTap: (){ print("google");},),
                          SocialIcon(bgColor:bgButtonBlue,color: Colors.white, svgImage: 'assets/icons/facebook-2.svg',onTap: (){print("facebook");},),
                          SocialIcon(bgColor:lightBlue,color: Colors.white, svgImage: 'assets/icons/twitter.svg',onTap: (){print("twitter");},),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  children:  [
                    Text("Register with socials",style:  registerHeadingStyle,),
                  ],
                ),
                const SizedBox(height: 15,),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      InputFieldWidget(
                        initialValue: "Email@gmail.com",
                        // hintText: "Email@gmail.com",
                        labelText: "Email",
                        validate:formProvider.validateUsername,
                        onSaved: formProvider.onSaveUsername,
                        prefixIcon: const Icon(Icons.person,color: lightBlue,),
                      ),
                      const SizedBox(height: 20,),
                      InputFieldSuffixIcon(
                        initialValue: "12345678",
                        labelText: "password",
                        prefixIcon: const Icon(Icons.https,color: lightBlue,),
                        validate:formProvider.validatePassword,
                        onSaved: formProvider.onSavedPassword,
                        onChanged:formProvider.onChancedPassword ,
                      ),const SizedBox(height: 20,),
                      InputFieldSuffixIcon(
                        initialValue: "12345678",
                        labelText: "Confirm password",
                        prefixIcon: const Icon(Icons.https,color: lightBlue,),
                        validate:formProvider.validateConfirmPassword,
                        onChanged: formProvider.onChangedConfirmPassword,
                        onSaved:formProvider.onSaveConfirmPassword,
                      ),
                      const SizedBox(height: 10,),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16,),
                          children:  <TextSpan>[
                            TextSpan(text: ' Bt creating an account I accept the ',style: privacyHeadingStyle),
                            TextSpan(text: 'Terms & Conditions', style: privacyHeadingStyle.copyWith(color: Colors.blue)),
                            TextSpan(text: ' and!',style: privacyHeadingStyle),
                            TextSpan(text: ' privacy policy!',style: privacyHeadingStyle.copyWith(color: Colors.blue)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      FormButton(

                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            formProvider.onSubmit();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("VaLIDATION PASSED"))
                            );
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("VALIDATION ERROR")));
                          }
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        padding:EdgeInsets.symmetric(vertical: 15) ,
                        bgcolor: Colors.deepOrange.withOpacity(0.7), color: Colors.white,
                        width: double.infinity, textButton: 'Join Us',),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already a member?",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 3,),
                      InkWell(
                        // onTap: onTab,
                        onTap: (){
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
                        },
                        child: const Text("Sign Up",
                          style: TextStyle(fontSize: 18,color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          )
      ),
    );
  }
}
