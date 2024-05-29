import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_app/core/di/di.dart';
import 'package:task_manager_app/core/reusable_components/text_field.dart';
import 'package:task_manager_app/presentation/screens/auth_screen/auth_viewmodel.dart';
import 'package:task_manager_app/presentation/screens/home_screen/home_screen.dart';

import '../../../core/constant.dart';
import '../../../core/local_storage/shared_prefrence_helper.dart';
import '../../../core/reusable_components/dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String route = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true ;
  GlobalKey<FormState>formKey = GlobalKey<FormState>();
  final emilController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/img/login_background.png"),fit: BoxFit.fill)
        ),
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>  getIt<AuthViewModel>(),
          child: ListView(
            children:[ Column(
              children: [
                SizedBox(height: 186.h,),
                Text("My\nGallery ",style: TextStyle(color: Theme.of(context).colorScheme.scrim,fontSize: 50.sp,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                SizedBox(height: 40.h,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(32.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Container(
                      height: 405.h,
                      width: 465.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: Padding(
                        padding: REdgeInsets.only(
                          left: 33,
                          right: 33,
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 40.h,),
                              Text("LOG IN",style: TextStyle(color: Theme.of(context).colorScheme.scrim,fontWeight: FontWeight.bold,fontSize: 30.sp),),
                              SizedBox(height: 30.h,),
                              CustomTextField(
                                lapel: "Email",
                                validate:  (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email shouldn\'t be empty ';
                                  }else if(!RegExp(Constant.emailRegExp).hasMatch(value)){
                                    return 'Enter valid email';
                                  }else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                formKay: formKey,
                                controller: emilController,
                              ),
                              SizedBox(height: 30.h,),

                              CustomTextField(
                                lapel: "Password",
                                formKay: formKey,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                validate:  (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'password should n\'t be empty ';
                                  }
                                  return null;
                                },
                                controller: passwordController,

                              ),
                              SizedBox(height: 30.h,),

                              BlocConsumer<AuthViewModel,AuthState>(
                                builder: (context, state) {
                                  if(state is AuthLoadingState){
                                    return ElevatedButton(
                                        onPressed: (){},
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(double.maxFinite, 46.11.h),
                                          backgroundColor: Theme.of(context).colorScheme.secondary,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
                                        ),
                                        child: const CircularProgressIndicator(color: Colors.white,),
                                    );
                                  }
                                  return ElevatedButton(
                                      onPressed: (){
                                        if(formKey.currentState!.validate()){
                                          AuthViewModel.get(context).login(email: emilController.text, password: passwordController.text);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(double.maxFinite, 46.11.h),
                                        backgroundColor: Theme.of(context).colorScheme.secondary,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
                                      ),
                                      child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.bold,fontStyle:FontStyle.normal ),)
                                  ) ;
                                },
                                listener: (context, state) {
                                  if(state is AuthErrorState){
                                    DialogUtil.showMessageDialog(context: context, message: "email or password are wrong", oneButtonDialog: true);
                                  }
                                  if(state is AuthSuccessState){
                                    Fluttertoast.showToast(
                                        msg: "log in done successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 10.0.sp
                                    );
                                    PrefsHelper.setToken(state.userData!.token!);
                                    PrefsHelper.setUseName(state.userData!.user!.name!);
                                    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (route) => false);
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                  ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
