import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef Validate = String? Function(String?)?;

class CustomTextField extends StatelessWidget {


  const CustomTextField({
    super.key,
    this.lapel,
    this.obscureText = false,
    this.iconButton,
    this.keyboardType = TextInputType.text,
    this.formKay,
    this.validate,
    this.prefixIconButton,
    this.controller,
    this.maxLength
  });


  final String? lapel;
  final bool obscureText;
  final IconButton? iconButton;
  final IconButton? prefixIconButton;
  final TextInputType keyboardType;
  final GlobalKey<FormState>? formKay;
  final Validate validate;
  final TextEditingController? controller;
  final int? maxLength ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
        contentPadding: REdgeInsets.only(
          left: 25,
          top: 15,
          bottom: 15
        ),
        fillColor: Colors.white,
        filled: true,
        errorStyle: const TextStyle(color: Colors.red),
        suffixIcon: Padding(
          padding: REdgeInsets.all(11.0),
          child: iconButton,
        ),
        prefixIcon: prefixIconButton,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide:
                BorderSide(color: Colors.white, width: 20.w)),
        hintText: lapel,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xff988F8C),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.w),
          borderRadius: BorderRadius.circular(30.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.w),
          borderRadius: BorderRadius.circular(30.r),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.white, width: 1.w)),
      ),
      controller: controller,
      validator: validate,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
    );
  }
}
