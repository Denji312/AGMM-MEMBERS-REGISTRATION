import 'package:flutter/material.dart';
import 'package:myapps/RegPage.dart';
import 'dart:io' show Platform;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _navigateBasedOnPlatform(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      // Navigate to RegPageWidget for mobile platforms
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegPageWidget()),
      );
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      // Navigate to RegPageWidget for desktop platforms
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegPageWidget()),
      );
    } else {
      // Handle other platforms if necessary
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegPageWidget()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor:
            Colors.amberAccent, // Equivalent to FlutterFlowTheme warning color
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/boheco_logo-removebg-preview.png',
                    width: 290,
                    height: 305,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'BOHECO II',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '"Bringing light into the lives of our Member-Consumer-Owners (MCOs)."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _navigateBasedOnPlatform(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0518EB),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
