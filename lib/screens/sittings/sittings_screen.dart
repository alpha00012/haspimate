import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Soft gray background
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              // Shapes for decoration
              _buildShapes(),

              // Main content
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Title
                  _buildTitle(screenWidth),

                  const SizedBox(height: 20),

                  // User Preferences Section
                  _buildStyledCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle("User Preferences"),
                        ListTile(
                          leading: const Icon(Icons.language, color: Colors.blueAccent),
                          title: const Text("Language"),
                          subtitle: const Text("Select your preferred language"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle language settings
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.notifications, color: Colors.blueAccent),
                          title: const Text("Notifications"),
                          subtitle: const Text("Manage your notification settings"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle notification settings
                          },
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                  ),

                  const SizedBox(height: 20),

                  // Application Settings Section
                  _buildStyledCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle("Application Settings"),
                        ListTile(
                          leading: const Icon(Icons.dark_mode, color: Colors.blueAccent),
                          title: const Text("Dark Mode"),
                          subtitle: const Text("Enable or disable dark mode"),
                          trailing: Switch(
                            value: false, // Replace with a state variable
                            onChanged: (bool value) {
                              // Handle dark mode toggle
                            },
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.security, color: Colors.blueAccent),
                          title: const Text("Privacy"),
                          subtitle: const Text("Manage your privacy settings"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle privacy settings
                          },
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                  ),

                  const SizedBox(height: 20),

                  // About Section
                  _buildStyledCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle("About"),
                        ListTile(
                          leading: const Icon(Icons.info, color: Colors.blueAccent),
                          title: const Text("App Version"),
                          subtitle: const Text("1.0.0"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.help, color: Colors.blueAccent),
                          title: const Text("Help & Support"),
                          subtitle: const Text("Get assistance or provide feedback"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle help and support
                          },
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                  ),

                  const SizedBox(height: 40), // Added padding at the bottom
                ],
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: 2, // Ensure the current index is set to Settings
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/robotrecyclestats');
              break;
            case 1:
              Navigator.pushNamed(context, '/map');
              break;
            case 2:
              Navigator.pushNamed(context, '/settings');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Recycle Stats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.blueAccent),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  // Function for SVG shapes decoration
  Widget _buildShapes() {
    return Stack(
      children: [
        Positioned(
          top: -50,
          left: -50,
          child: SvgPicture.asset(
            'assets/shapes.svg',
            width: 235,
            height: 173,
          ),
        ),
        Positioned(
          bottom: -50,
          right: -50,
          child: SvgPicture.asset(
            'assets/shapes2.svg',
            width: 235,
            height: 173,
          ),
        ),
      ],
    );
  }

  // Function for the title
  Widget _buildTitle(double screenWidth) {
    return Text(
      "Settings",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black87,
        fontSize: screenWidth * 0.08,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // Styled card widget
  Widget _buildStyledCard({required Widget child, required EdgeInsets padding}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
