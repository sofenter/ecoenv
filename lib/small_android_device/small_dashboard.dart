import 'package:flutter/material.dart';
import 'package:po_app/constants/color_constants.dart';
import 'package:po_app/constants/footer_file.dart';

class SmallDashboardPage extends StatefulWidget {
  const SmallDashboardPage({super.key});

  @override
  State<SmallDashboardPage> createState() => _SmallDashboardPageState();
}

class _SmallDashboardPageState extends State<SmallDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit Dashboard"),
        backgroundColor: AppColor.appBarColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ]),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Eco Friendly",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("You Love Environment"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Device Exchanged"),
              trailing: Text("5"),
            ),
            ListTile(
              title: Text("Credit Earned"),
              trailing: Text("5000"),
            ),
            ListTile(
              title: Text("Earnings"),
              trailing: Text("50000"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Withdraw")),
            ElevatedButton(onPressed: () {}, child: Text("Donate")),
            Spacer(),
            FooterConstants(),
          ],
        ),
      ),
    );
  }
}
