import 'package:flutter/material.dart';
import 'package:practicas_flutter/core/theme/color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_outlined, size: 4.h, color: mainGrey),
          SizedBox(height: 5.h),
          Text(
            message, 
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}