import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:po_app/constants/color_constants.dart';
import 'package:po_app/constants/footer_file.dart';

class SmallProductInfo extends StatefulWidget {
  const SmallProductInfo({super.key});

  @override
  State<SmallProductInfo> createState() => _SmallProductInfoState();
}

class _SmallProductInfoState extends State<SmallProductInfo> {
  // harm score slider
  double harmSlider = 100.0;

  // controller for precious metals
  TextEditingController preciousMetalController = TextEditingController();

  @override
  void initState() {
    preciousMetalController.text = 'Some Data...';
    super.initState();
  }

  @override
  void dispose() {
    preciousMetalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Produt Info"),
          backgroundColor: AppColor.appBarColor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  title: Text("Device Type"),
                  trailing: Text("null"),
                ),
                const ListTile(
                  title: Text("Model"),
                  trailing: Text("null"),
                ),
                const ListTile(
                  title: Text("Brand"),
                  trailing: Text("null"),
                ),
                const ListTile(
                  title: Text("Year"),
                  trailing: Text("null"),
                ),
                const ListTile(
                  title: Text("Age"),
                  trailing: Text("null"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Precious Metals",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonHideUnderline(
                  child: TextFormField(
                    controller: preciousMetalController,
                    readOnly: true,
                    minLines: 1,
                    maxLines: 7,
                    decoration: InputDecoration(
                      fillColor: AppColor.formFieldBgColor,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Current Harm Score",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Slider.adaptive(
                  min: 0,
                  max: 100,
                  value: harmSlider,
                  onChanged: (val) {
                    setState(() {
                      harmSlider = val;
                    });
                    debugPrint(val.toStringAsFixed(0));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("0"),
                      Text("100"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'NOTE : '),
                      TextSpan(text: 'If Harm Score >= 60, must dispose.'),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Search Centers',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FooterConstants(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
