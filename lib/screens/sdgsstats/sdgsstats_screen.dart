// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SDGsStatsScreen extends StatelessWidget {
  const SDGsStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: Stack(
        children: [
          // Top Left Decoration
          Positioned(
            top: -50,
            left: -50,
            child: SvgPicture.asset(
              'assets/top_left_sdg_shape.svg',
              width: screenWidth * 0.4,
              height: screenWidth * 0.4,
              color: const Color(0xFF00A859),
            ),
          ),

          // Bottom Right Decoration
          Positioned(
            bottom: -50,
            right: -50,
            child: SvgPicture.asset(
              'assets/bottom_right_sdg_shape.svg',
              width: screenWidth * 0.4,
              height: screenWidth * 0.4,
              color: const Color(0xFF00A859),
            ),
          ),

          // Main Content
          Column(
            children: [
              const SizedBox(height: 50),

              // Title Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Sustainable Development Goals 🌍",
                  style: TextStyle(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Statistics Card Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Global SDG Data",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF00A859),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Efforts towards clean energy, education, and reduced inequalities have increased globally.",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              // SDG Progress Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SDG Tasks Progress:",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SDGCard(
                          icon: Icons.solar_power,
                          title: "Clean Energy",
                          progress: "60%",
                          progressValue: 0.6,
                        ),
                        SDGCard(
                          icon: Icons.school,
                          title: "Quality Education",
                          progress: "75%",
                          progressValue: 0.75,
                        ),
                        SDGCard(
                          icon: Icons.equalizer,
                          title: "Reduced Inequality",
                          progress: "50%",
                          progressValue: 0.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Footer Icon
              SvgPicture.asset(
                'assets/sdg_footer_icon.svg',
                width: screenWidth * 0.6,
                color: const Color(0xFF00A859),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SDGCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String progress;
  final double progressValue;

  const SDGCard({
    required this.icon,
    required this.title,
    required this.progress,
    required this.progressValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: const Color(0xFF00A859)),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progressValue,
            color: const Color(0xFF00A859),
            backgroundColor: Colors.grey[700],
          ),
          const SizedBox(height: 8),
          Text(
            progress,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
