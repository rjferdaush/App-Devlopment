import 'package:flutter/material.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FA),

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: screenWidth * 0.07,
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF6A0DAD),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6A0DAD),
        onPressed: () {},
        child: const Icon(Icons.edit, color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.025,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.shade200,
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: screenWidth * 0.15,
                backgroundImage: const AssetImage("assets/image/photo_2026-04-03_14-42-37.jpg")
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            Text(
              "Ferdaush Bin Islam",
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: screenHeight * 0.015),

            Text(
              "I Am a CSE Student In BUBT At 7th Semester\nI want to be best in IT sector & Now I Join in Ostad for App Development\nOur Mentor Is So Much Extra Ordinary I Like Her Learning Style",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF555566),
                height: 1.6,
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.035),
              decoration: BoxDecoration(
                color: const Color(0xFFEDE7F6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: const Color(0xFF6A0DAD),
                    size: screenWidth * 0.075,
                  ),
                  SizedBox(width: screenWidth * 0.035),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6A0DAD),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "Dhaka Bangladesh",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: const Color(0xFF333344),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.035),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFE8F5E9),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school_outlined,
                    color: const Color(0xFF2E7D32),
                    size: screenWidth * 0.075,
                  ),
                  SizedBox(width: screenWidth * 0.035),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Education",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2E7D32),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "BSc in CSE\nBUBT University — 7th Semester",
                        style: TextStyle(
                          fontSize: screenWidth * 0.033,
                          color: const Color(0xFF333344),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.035),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFE3F2FD),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.code,
                    color: const Color(0xFF1565C0),
                    size: screenWidth * 0.075,
                  ),
                  SizedBox(width: screenWidth * 0.035),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skills",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1565C0),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        "C++, Flutter, Dart, Python, GitHub\nHTML, CSS",
                        style: TextStyle(
                          fontSize: screenWidth * 0.033,
                          color: const Color(0xFF1565C0),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.05),

            Text(
              "Connect With Me",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A1A2E),
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth * 0.14,
                        height: screenWidth * 0.14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1877F2),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF1877F2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: screenWidth * 0.07,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      Text(
                        "Facebook",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: const Color(0xFF444455),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: screenWidth * 0.06),

                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth * 0.14,
                        height: screenWidth * 0.14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF24292E),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF24292E),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.code_rounded,
                          color: Colors.white,
                          size: screenWidth * 0.07,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      Text(
                        "GitHub",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: const Color(0xFF444455),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: screenWidth * 0.06),

                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth * 0.14,
                        height: screenWidth * 0.14,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEA4335),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFEA4335),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                          size: screenWidth * 0.07,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.008),
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: const Color(0xFF444455),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.04),
          ],
        ),
      ),
    );
  }
}