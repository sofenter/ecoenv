import 'package:flutter/material.dart';
import 'package:po_app/constants/color_constants.dart';
import 'package:po_app/constants/footer_file.dart';

class SmallRegisterShopPage extends StatefulWidget {
  const SmallRegisterShopPage({super.key});

  @override
  State<SmallRegisterShopPage> createState() => _SmallRegisterShopPageState();
}

class _SmallRegisterShopPageState extends State<SmallRegisterShopPage> {
  // controllers
  TextEditingController shopCityStateController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController nearbyController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    shopCityStateController.dispose();
    fnameController.dispose();
    lnameController.dispose();
    phoneController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    nearbyController.dispose();
    stateController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Collection Center"),
        backgroundColor: AppColor.appBarColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Center Name"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: shopCityStateController,
                    decoration: const InputDecoration(
                      hintText: 'Shop, City, State',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Owner Name"),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: TextFormField(
                        controller: fnameController,
                        decoration: const InputDecoration(
                          hintText: 'fname',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4.2,
                      child: TextFormField(
                        controller: lnameController,
                        decoration: const InputDecoration(
                          hintText: 'lname',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Phone"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Latitude"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: latitudeController,
                    decoration: const InputDecoration(
                      hintText: 'Latitude',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Longitude"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: longitudeController,
                    decoration: const InputDecoration(
                      hintText: 'Longitude',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nearby"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: nearbyController,
                    decoration: const InputDecoration(
                      hintText: 'Nearby',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("State"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: stateController,
                    decoration: const InputDecoration(
                      hintText: 'State',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("City"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      hintText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ),
            ),
            const Spacer(),
            const FooterConstants(),
          ],
        ),
      ),
    );
  }
}
