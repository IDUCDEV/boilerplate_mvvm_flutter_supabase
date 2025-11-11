import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import '../../colors/app_theme.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        progressValue += 0.3333; // Increment progress by 33.33% every second
        if (progressValue >= 1.0) {
          timer.cancel();
          // Navigate to login, redirect will handle based on auth
          GoRouter.of(context).go('/login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace with your app logo
              Text("Splash Screen"),
              const SizedBox(height: 16),
              const Text(
                '© 2025 Developed By IDUCDEV',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
