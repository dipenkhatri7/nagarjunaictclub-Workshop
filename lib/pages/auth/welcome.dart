import 'package:flutter/material.dart';
import 'package:workshop/pages/auth/login.dart';
import 'package:workshop/utils/textStyles.dart';
import 'package:workshop/widgets/customButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Welcome',
              style: textStyle(
                38,
                
                Colors.black,
                FontWeight.w600,
                0,
              ),
            ),
            Text(
              'In Flutter Fundamentals',
              style: textStyle(
                14,
                Colors.black,
                FontWeight.w400,
                1.0,
              ),
            ),
            const Spacer(),
            const Hero(
              tag: 'logo',
              child: Image(
                image: AssetImage("assets/images/animation.gif"),
                height: 250,
              ),
            ),
            const Spacer(),
            Hero(
              tag: 'login',
              child: CustomButton(
                text: "Let's Get Started",
                width: MediaQuery.of(context).size.width * 0.8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                fontSize: 16,
                borderRadius: 30,
                color: Colors.blueAccent,
                textColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'In Collaboration With',
              style: textStyle(
                14,
                Colors.black,
                FontWeight.w400,
                1.0,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage("assets/images/logo1.png"),
                  height: 50,
                  width: 50,
                ),
                Image(
                  image: AssetImage("assets/images/logo2.png"),
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
