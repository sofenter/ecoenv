import 'package:flutter/material.dart';
import 'package:po_app/constants/footer_file.dart';
import 'package:po_app/responsive_layout.dart';
import 'package:po_app/small_android_device/small_register_old-device.dart';
import 'package:po_app/small_android_device/small_register_shop.dart';
import 'package:po_app/tab_android_device/tab-register_shop.dart';
import 'package:po_app/tab_android_device/tab_register_old_device.dart';

import '../constants/color_constants.dart';

class SmallAdminPortalButtons extends StatefulWidget {
  const SmallAdminPortalButtons({super.key});

  @override
  State<SmallAdminPortalButtons> createState() => _SmallAdminPortalButtonsState();
}

class _SmallAdminPortalButtonsState extends State<SmallAdminPortalButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADMIN PORTAL"),
        backgroundColor: AppColor.appBarColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            SizedBox(width: 200,
              height: 40,

            child: ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>const ResponsiveLayout(mobileScreen: SmallRegisterShopPage(), tabletScreen: TabRegisterShopPage())));
            }, child: const Text("Register Collection Center"))),
            const SizedBox(height: 30,),

            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const ResponsiveLayout(mobileScreen: SmallRegisterOldDevicePage(), tabletScreen: TabRegisterOldDevicePage())));
              }, child: const Text("Register Old Device")),
            ),
            const SizedBox(height: 30,),

            SizedBox(width: 200,
              height: 40,

            child: ElevatedButton(onPressed: (){}, child: const Text("Update Disposal Status"))),
            const SizedBox(height: 30,),

            SizedBox(
              width: 200,
              height: 40,

              child: ElevatedButton(onPressed: (){}, child: const Text("Manage Spare Items"))),

            const Spacer(),
            const FooterConstants(),
          ],
        ),
      ),
    );
  }
}