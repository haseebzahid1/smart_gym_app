import 'package:flutter/material.dart';
import 'package:flutter_smart_gym/constant/theme_color.dart';
import 'package:flutter_smart_gym/page/signIn_page/sign_in_provider.dart';
import 'package:flutter_smart_gym/page/signUp_page/signUp_page.dart';
import 'package:flutter_smart_gym/widget/double_line.dart';
import 'package:flutter_smart_gym/widget/form_button.dart';
import 'package:flutter_smart_gym/widget/input_field.dart';
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
  bool checkboxIndex = false;
  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    final Size size  = MediaQuery.of(context).size;
    return  Container(
      decoration:  const BoxDecoration(
        color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(36, 0, 36, 0),
          child: ListView(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      IconButton(onPressed:(){
                        Navigator.of(context).pop();
                      }, icon: Icon(Icons.arrow_back), iconSize: 44,),
                      SizedBox(height: 10,),
                      Image.asset("assets/images/logo.png",height: size.height * 0.10,),
                    ],
                  ),
                  const SizedBox(height: 23,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Register with Socials",style: registerHeadingStyle ,),
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
                      Text("Login Using Email",style: registerHeadingStyle ,),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        InputFieldWidget(
                          initialValue: signInProvider.user.email ?? "Email@gmail.com",
                          // hintText: "Email@gmail.com",
                          labelText: "Email",
                          textInputType: TextInputType.emailAddress,
                          validate:signInProvider.validateUsername,
                          onSaved: signInProvider.onSaveUsername,
                          prefixIcon: const Icon(Icons.person,color: lightBlue,),
                          isPassword: false,
                        ),
                        const SizedBox(height: 17,),
                        InputFieldWidget(
                          initialValue: signInProvider.user.password ?? "12345678",
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.https,color: lightBlue,),
                          validate:signInProvider.validatePassword,
                          onSaved: signInProvider.onSavedPassword,
                          onChanged:signInProvider.onChancedPassword ,
                        ),
                        const SizedBox(height: 3,),
                        Row(
                          children: [
                            Expanded(
                              // flex:1,
                              child: CheckboxListTile(
                                contentPadding: EdgeInsets.only(left: 0),
                                  controlAffinity: ListTileControlAffinity.leading,
                                title: Text("Remember me",style: forgetPassword),
                                  value: checkboxIndex,
                                  onChanged: (bool? value){
                                  setState(() {
                                    checkboxIndex = value!;
                                  });
                                  }
                              ),
                            ),

                            Expanded(
                              // flex: 1,
                              child: GestureDetector(
                                onTap: (){
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CheckImg()));
                                },
                                child:  Text("Forgot Password",style: forgetPassword.copyWith(decoration: TextDecoration.underline, ),textAlign: TextAlign.right,),
                              ),
                            ),
                          ],
                        ),
                        FormButton(
                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              signInProvider.onSubmit();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: const Text("VaLIDATION PASSED"))
                              );
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("VALIDATION ERROR")));
                            }
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AnyNamepage()));
                          },
                          padding:EdgeInsets.symmetric(vertical: 13) ,
                          bgcolor: lightBlue.withOpacity(0.7), color: Colors.white,
                          width: double.infinity, textButton: 'Log in',),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));
                        },
                        child:  Text("Sign up here",
                          style: memberHeadingStyle.copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
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
