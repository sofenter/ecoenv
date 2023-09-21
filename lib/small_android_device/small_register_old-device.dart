import 'package:flutter/material.dart';
import 'package:po_app/constants/color_constants.dart';

class SmallRegisterOldDevicePage extends StatefulWidget {
  const SmallRegisterOldDevicePage({super.key});

  @override
  State<SmallRegisterOldDevicePage> createState() =>
      _SmallRegisterOldDevicePageState();
}

class _SmallRegisterOldDevicePageState
    extends State<SmallRegisterOldDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Old Devices"),
        backgroundColor: AppColor.appBarColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Center Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Center Name"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                        hintText: 'Shop, City, State',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
        
              Text(
                "User Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
        
              Text(
                "Device Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Device Type"),
                  DropdownButton(
                    items: const [],
                    onChanged: (val) {},
                    hint: const Text('Select Device Type'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Model"),
                  DropdownButton(
                    items: const [],
                    onChanged: (val) {},
                    hint: const Text('Select Model'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Brand"),
                  DropdownButton(
                    items: const [],
                    onChanged: (val) {},
                    hint: const Text('Select Brand'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Year"),
                  DropdownButton(
                    items: const [],
                    onChanged: (val) {},
                    hint: const Text('Select Year'),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
