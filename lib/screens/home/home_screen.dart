import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../auth/sign_in_screen.dart'; // Import de la page SignInScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Shapes SVG - Coin supérieur gauche
          Positioned(
            top: -50,
            left: -50,
            child: SvgPicture.asset(
              'assets/shapes.svg',
              width: screenWidth * 0.4,
              height: screenWidth * 0.4,
            ),
          ),

          // Shapes SVG - Coin inférieur droit
          Positioned(
            bottom: -50,
            right: -50,
            child: SvgPicture.asset(
              'assets/shapes2.svg',
              width: screenWidth * 0.4,
              height: screenWidth * 0.4,
            ),
          ),

          // Contenu central
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Texte principal "GreenBin"
                Text(
                  'HaspiMate',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: screenWidth * 0.1,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),

                // Texte secondaire
                Text(
                  'Manage your waste effectively!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: screenWidth * 0.045,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),

                // Image principale centrée
                SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.3,
                  child: Image.asset(
                    'assets/StartImg.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30),

                // Bouton "Get Started" avec Container décoré
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 383,
                    height: 69.5,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF37B843),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
