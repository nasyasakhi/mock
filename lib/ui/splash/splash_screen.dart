import 'package:flutter/material.dart';
import 'package:mock_apps/size_config.dart';
import 'package:mock_apps/ui/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context); 
    return const Scaffold(
      body: Body(),
    );
  }
}