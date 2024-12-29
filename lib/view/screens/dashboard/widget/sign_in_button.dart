import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 330.h,
        left: 50.w,
        right: 40.w,
      ),
      child: Container(
        width: 200.w, // You can adjust this value
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFF1493), // Dark pink
              Color(0xFFFFB6C1), // Light pink
            ],
          ),
          borderRadius: BorderRadius.circular(24.r), // Optional: Add rounded corners
        ),
        child: ElevatedButton(
          onPressed: () {
            // Add your action here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Use transparent color
            shadowColor: Colors.transparent, // Optional: Remove button shadow
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          ),
          child: const Text(
            "Sign in",
            style: TextStyle(
              color: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
