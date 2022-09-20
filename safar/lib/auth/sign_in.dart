

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:safar_frontend/constant/app_colors.dart';


enum SignInEnum  { Google, Facebook,Manually}

extension signInIndexExtension on SignInEnum?{

  static const names = {
    SignInEnum.Google: 'Google',
    SignInEnum.Facebook: 'Facebook',
    SignInEnum.Manually: 'Manually',

  };

  static const titles = {
    SignInEnum.Google: 'Sign up with Google',
    SignInEnum.Facebook: 'Sign up with Facebook',
    SignInEnum.Manually: 'Create account manually',
  };

  int toIndex(SignInEnum tab){
    switch(tab){

      case SignInEnum.Google:
        return 0;
      case SignInEnum.Facebook:
        return 1;
      case SignInEnum.Manually:
        return 2;

      default:
        throw Exception("Invalid");
    }
  }

  String? get title{
    return titles[this!];
  }

  String? get name{
    return names[this!];
  }

}

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  _SignINState createState() => _SignINState();
}

class _SignINState extends State<SignIN> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            color: Colors.black,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 360.h,
              width: 1.sw,
              decoration:  BoxDecoration(
                color: AppColors.whiteBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),topRight:  Radius.circular(40.r))
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 35.h,),
                  Text("Sign Up With",style: TextStyle(color: AppColors.primaryColor,fontSize: 30.sp,fontWeight: FontWeight.w700),),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41.5),
                    child: Column(
                      children: List.generate(SignInEnum.values.length, (index) {
                        return signInContainer(
                          index: index,
                          onTap: (){
                            onButtonClickAction(index);
                          }
                        );
                      }
                    ),
                  ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  onButtonClickAction(int index){


  }

  Widget signInContainer({required int index ,Function? onTap}){
    return InkWell(
      onTap: (){
        onTap!();
      },
      child: Padding(
        padding:  EdgeInsets.only(bottom: 13.h),
        child: Container(
          height: 53.h,
          decoration:  BoxDecoration(
              color: AppColors.whiteBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: AppColors.primaryColor,width: 1.w)
          ),
          child:index == 0 || index == 1 ? Row(
            children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                 child: Container(
                   height: 43.h,
                   width: 43.w,
                   decoration:  BoxDecoration(
                       color: AppColors.gray100,
                       borderRadius: BorderRadius.all(Radius.circular(10.r)),
                   ),
                 ),
               ),
               Padding(
                 padding:  EdgeInsets.only(left: 42.w),
                 child: Text(SignInEnum.values[index].title as String,
                   style: TextStyle(
                     fontWeight: FontWeight.w500,
                     fontSize: 16.sp
                   ),
                 ),
               ),
            ],
          )
          :Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 50.w),
                child: Text(SignInEnum.values[index].title as String,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
