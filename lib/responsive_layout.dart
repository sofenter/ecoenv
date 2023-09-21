import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileScreen,
    required this.tabletScreen,
  });
  final Widget mobileScreen;
  final Widget tabletScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 640) {
          return mobileScreen;
        } else if (constraints.maxWidth <= 1280) {
          return Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "UNDER MAINTENANCE",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "we will shorty notify you about this.",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text(
                "Not Available For Windows/MAC/Linux Right Now.",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
