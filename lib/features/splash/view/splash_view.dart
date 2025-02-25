import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:task_management_app/core/constants/colors_constants.dart';
import 'package:task_management_app/core/utils/styles/text_style.dart';
import 'package:task_management_app/features/nav_bar/view/nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 5)).then((value) {
      return Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NavBar(),),
              (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Task Manager',style: mainBold20.copyWith(color: neutral.shade900),),
              LoadingAnimationWidget.horizontalRotatingDots(color: primary.shade500, size: 50),
            ],
          ),
        )
    );
  }
}
