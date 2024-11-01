import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi animasi fade-in
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);

    _controller!.forward();

    // Timer untuk berpindah ke halaman Home setelah animasi selesai
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background/bg-splash.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Centered text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/bunga.png",
                  width: 150,
                  height: 150,
                ),
              ),
              Text(
                "Hello Fellas",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Temukan segala jenis bunga \n dari berbagai belahan dunia!",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
