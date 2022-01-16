import 'package:flutter/material.dart';
import 'package:flutter_smart_gym/constant/theme_color.dart';
import 'package:flutter_smart_gym/page/signIn_page/sign_in_provider.dart';
import 'package:flutter_smart_gym/widget/double_line.dart';
import 'package:flutter_smart_gym/widget/form_button.dart';
import 'package:flutter_smart_gym/widget/input_field.dart';
import 'package:flutter_smart_gym/widget/inputfield_suffixicon_widget.dart';
import 'package:flutter_smart_gym/widget/social_icon.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (context)=>SignInProvider(),
      child: LoginPageWidget(),);
  }
}

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final _formKey = GlobalKey<FormState>();

  bool remember = false;

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(40, 30, 40, 20),
            width: size.width,
            // height: size.height,
            decoration:  const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),fit: BoxFit.cover
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
                      Text("Login Using Email",style: registerHeadingStyle ,),
                      const SizedBox(height: 15,),
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
                const SizedBox(height: 6,),
                DoubleLine(),
                const SizedBox(height: 6,),
                Row(
                  children:  [
                    Text("Login Using Socials",style: registerHeadingStyle ,),
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
                        validate:signInProvider.validateUsername,
                        onSaved: signInProvider.onSaveUsername,
                        prefixIcon: const Icon(Icons.person,color: lightBlue,),
                      ),
                      const SizedBox(height: 20,),
                      InputFieldSuffixIcon(
                        initialValue: "12345678",
                        labelText: "password",
                        prefixIcon: const Icon(Icons.https,color: lightBlue,),
                        validate:signInProvider.validatePassword,
                        onSaved: signInProvider.onSavedPassword,
                        onChanged:signInProvider.onChancedPassword ,
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [

                          Checkbox(
                              value: remember,
                              activeColor: kPrimaryColor,
                              onChanged: (bool? value){
                                setState(() {
                                  remember = value!;
                                  print(remember);
                                });
                              }
                          ),
                          Text("remember me",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CheckImg()));
                            },
                            child: const Text("Forgot Password",style: TextStyle(decoration: TextDecoration.underline)),
                          ),
                        ],
                      ),
                      FormButton(

                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            signInProvider.onSubmit();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("VaLIDATION PASSED"))
                            );
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("VALIDATION ERROR")));
                          }
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AnyNamepage()));
                        },
                        padding:EdgeInsets.symmetric(vertical: 15) ,
                        bgcolor: Colors.deepOrange.withOpacity(0.7), color: Colors.white,
                        width: double.infinity, textButton: 'Join Us',),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",
                      style: memberHeadingStyle,
                    ),
                    SizedBox(width: 3,),
                    InkWell(
                      // onTap: onTab,
                      onTap: (){
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
                      },
                      child:  Text("Sign up here",
                        style: memberHeadingStyle.copyWith(color: Colors.blue),
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
