import 'package:flutter/material.dart';

class TabDisposalsHistoryPage extends StatefulWidget {
  const TabDisposalsHistoryPage({super.key});

  @override
  State<TabDisposalsHistoryPage> createState() => _TabDisposalsHistoryPageState();
}

class _TabDisposalsHistoryPageState extends State<TabDisposalsHistoryPage> {
  @override
  Widget build(BuildContext context) {
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
  }
}