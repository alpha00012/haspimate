import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RobotTrackingScreen extends StatefulWidget {
  const RobotTrackingScreen({super.key});

  @override
  State<RobotTrackingScreen> createState() => _RobotTrackingScreenState();
}

class _RobotTrackingScreenState extends State<RobotTrackingScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset("assets/map.mp4")
      ..initialize().then((_) {
        setState(() {});
        _videoController.setLooping(true);
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Soft gray background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Title
              _buildTitle(screenWidth),

              const SizedBox(height: 20),

              // Video map with robot and paths
              _buildVideoWithMarker(screenWidth, screenHeight),

              const SizedBox(height: 20),

              // Robot information in a styled card
              _buildStyledCard(
                child: _buildRobotInfo(),
                padding: const EdgeInsets.all(16),
              ),

              const SizedBox(height: 20),

              // Traffic notifications in a styled card
              _buildStyledCard(
                child: _buildTrafficNotifications(),
                padding: const EdgeInsets.all(16),
              ),

              const SizedBox(height: 20),

              // Circuit information in a styled card
              _buildStyledCard(
                child: _buildCircuitInfo(),
                padding: const EdgeInsets.all(16),
              ),

              const SizedBox(height: 40), // Added padding at the bottom
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
        currentIndex: 1, // Current index set to Map page
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/robotrecyclestats');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/map');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/settings');
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
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  // Function for the title
  Widget _buildTitle(double screenWidth) {
    return Text(
      "Robot Tracker",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black87,
        fontSize: screenWidth * 0.08,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // Video with a dynamic marker
  Widget _buildVideoWithMarker(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (_videoController.value.isInitialized)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            )
          else
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  // Styled card widget
  Widget _buildStyledCard(
      {required Widget child, required EdgeInsets padding}) {
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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  // Robot information widget
  Widget _buildRobotInfo() {
    return Column(
      children: const [
        Text(
          "Battery: 85%",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Speed: 1.5 m/s",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Mode: Autonomous",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Traffic notifications widget
  Widget _buildTrafficNotifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Traffic Alerts:",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "- Heavy traffic on Route A",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          "- Roadblock near Station B",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          "- Clear route via Route C",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  // Circuit information widget
  Widget _buildCircuitInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Circuit Information:",
          style: TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "- Total Distance: 15 km",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          "- Estimated Time: 30 mins",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          "- Checkpoints: 5",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
