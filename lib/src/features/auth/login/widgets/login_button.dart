import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:together/theme/colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const LoginButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: XColors.primary,
        fixedSize: Size(ScreenUtil().screenWidth, 55),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
