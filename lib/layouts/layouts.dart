import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:free_movies/modules/home_screen/home_screen.dart';

Widget splashScreen(context) => AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'assets/images/splash.png',
            width: 200,
            height: 200,
          ),
          Text(
            'Movies App',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.red,
      nextScreen: const HomeScreen(),
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.sizeTransition,
    );
