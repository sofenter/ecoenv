import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indexed/indexed.dart';
import 'package:location/location.dart';
import 'package:po_app/constants/footer_file.dart';
import 'package:po_app/responsive_layout.dart';
import 'package:po_app/small_android_device/small_admin_portal_btn.dart';
import 'package:po_app/small_android_device/small_dashboard.dart';
import 'package:po_app/small_android_device/small_disposals_history.dart';
import 'package:po_app/small_android_device/small_login.dart';
import 'package:po_app/small_android_device/small_product_info.dart';
import 'package:po_app/tab_android_device/tab_admin_portal.dart';
import 'package:po_app/tab_android_device/tab_dashboard.dart';
import 'package:po_app/tab_android_device/tab_disposals.dart';
import 'package:po_app/tab_android_device/tab_login.dart';

import '../constants/color_constants.dart';
import '../tab_android_device/tab_product_info.dart';

class SmallHomePage extends StatefulWidget {
  const SmallHomePage({super.key});

  @override
  State<SmallHomePage> createState() => _SmallHomePageState();
}

class _SmallHomePageState extends State<SmallHomePage> {
  // google map constants
  Location currentLocation = Location();
  GoogleMapController? _mapController;
  Map<String, Marker> _marker = {};

  // default location in google map
  double lat = 0;
  double long = 0;
  // static LatLng currentLocation = LatLng(lat, long);
  // search focus
  FocusNode searchFocus = FocusNode();

  // BUTTONS LIST
  List buttonWithText = [
    {
      'img':
          'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png',
      'text': 'Repair',
    },
    {
      'img':
          'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png',
      'text': 'Solve',
    },
    {
      'img':
          'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png',
      'text': 'Admin',
    },
    {
      'img':
          'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png',
      'text': 'Resolve',
    },
    {
      'img':
          'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png',
      'text': 'Donate',
    },
    {
      'img':
          'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png',
      'text': 'Book',
    },
    {
      'img':
          'https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png',
      'text': 'Map',
    },
  ];

  // add marker method
  addCentreMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
       ImageConfiguration(
      ),
      "assets/collectionCenter.png",
      
    );

    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      icon: markerIcon,
    );
    setState(() {
      _marker[id] = marker;
    });
  }

  // add marker method
  addLiveMarker(String id, LatLng location) async {
    // var markerIcon = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(), "assets/collectionCenter.png");

    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      // icon: markerIcon,
    );
    setState(() {
      _marker[id] = marker;
    });
  }

  // get current location
  bool scrollEnable = false;
  double cameraZoom = 15.0;
  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _mapController
          ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: cameraZoom,
      )));
      addLiveMarker('home', LatLng(loc.latitude!, loc.longitude!));
      setState(() {
        lat = loc.latitude!;
        long = loc.longitude!;
      });
      // setState(() {
      //   _marker.add(Marker(markerId: MarkerId('Home'),
      //       position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
      //   ));
      // });
    });
  }

  // void liveLocation(){
  //   LocationSettings locationSettings = LocationSettings(accuracy: LocationAccuracy.high,distanceFilter: 100);
  //   Geolocator.getPositionStream(
  //     locationSettings: locationSettings
  //   ).listen((Position position) {
  //     lat = position.latitude;
  //     long = position.longitude;
  //   })
  // }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  void dispose() {
    searchFocus.dispose();
    _mapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Exit"),
            content: const Text("Are you sure want to exit ?"),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("NO"),
              ),
              MaterialButton(
                onPressed: () async {
                  SystemNavigator.pop();
                },
                child: const Text("YES"),
              ),
            ],
          ),
        );
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.appBarColor,
            actions: [
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResponsiveLayout(
                          mobileScreen: SmallAdminPortalButtons(),
                          tabletScreen: TabAdminPortalBtn(),
                        ),
                      ),
                    );
                  }
                  else if (value == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResponsiveLayout(
                          mobileScreen: SmallDisposalsHistoryPage(),
                          tabletScreen: TabDisposalsHistoryPage(),
                        ),
                      ),
                    );
                  }
                  else if (value == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResponsiveLayout(
                          mobileScreen: SmallDashboardPage(),
                          tabletScreen: TabDashboardPage(),
                        ),
                      ),
                    );
                  }
                },
                tooltip: 'Profile',
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 1,
                      child: const Text("Admin Portal"),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const Text("Disposals History"),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: const Text("Credit Dashboard"),
                      onTap: () {},
                    ),
                  ];
                },
                icon: const Icon(Icons.account_circle_outlined),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Logout Successfull"),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResponsiveLayout(
                        mobileScreen: SmallLoginPage(),
                        tabletScreen: TabLoginPage(),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.logout,
                ),
              ),
            ],
            title: const Text(
              "HOME",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              physics: scrollEnable
                  ? NeverScrollableScrollPhysics()
                  : AlwaysScrollableScrollPhysics(),
              child: Indexer(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            scrollEnable = false;
                          });
                        },
                        child: Indexed(
                          index: 1,
                          child: TextFormField(
                            focusNode: searchFocus,
                            decoration: InputDecoration(
                              hintText: 'Search Collection Center',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                ),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            scrollEnable = false;
                          });
                        },
                        child: Indexed(
                          index: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DropdownButton(
                                items: const [],
                                onChanged: (val) {},
                                hint: const Text('State'),
                              ),
                              DropdownButton(
                                items: const [],
                                onChanged: (val) {},
                                hint: const Text('City'),
                              ),
                              DropdownButton(
                                items: const [],
                                onChanged: (val) {},
                                hint: const Text('Device type'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Indexed(
                        index: 2,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GoogleMap(
                            compassEnabled: true,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            tiltGesturesEnabled: true,
                            zoomGesturesEnabled: true,
                            onCameraMove: (cameraPosition) {
                              setState(() {
                                cameraZoom = cameraPosition.zoom;
                              });
                            },
                            onTap: (a) {
                              setState(() {
                                scrollEnable = true;
                              });
                            },
                            initialCameraPosition: CameraPosition(
                              zoom: 15,
                              target: LatLng(lat, long),
                            ),
                            onMapCreated: (controller) {
                              _mapController = controller;
                              addCentreMarker(
                                  'test', const LatLng(25.854928, 85.778025));
                              addCentreMarker(
                                  'test2', const LatLng(26.180256, 85.863931));
                              addCentreMarker(
                                  'test3', const LatLng(26.178831, 85.864564));
                              addCentreMarker(
                                  'test4', const LatLng(26.178831, 85.864564));
                              addCentreMarker(
                                  'test4', const LatLng(26.180333, 85.866248));
                            },
                            markers: _marker.values.toSet(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            scrollEnable = false;
                          });
                        },
                        child: Indexed(
                          index: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Check Product Info",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Year"),
                                    DropdownButton(
                                      items: const [],
                                      onChanged: (val) {},
                                      hint: const Text('Select Year'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const ResponsiveLayout(
                                              mobileScreen: SmallProductInfo(),
                                              tabletScreen: TabProductInfo(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Get Product Info",
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            scrollEnable = false;
                          });
                        },
                        child: Indexed(
                          index: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  onPressed: () async {
                                    FlutterPhoneDirectCaller.callNumber(
                                        '7479620434');
                                  },
                                  child: const Text(
                                    "Contact Helpline",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FooterConstants(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // show bottom sheet of each button
  Future<void> showSheet({
    required int index,
    required Widget widget,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (_) => FractionallySizedBox(
        heightFactor: 0.95,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.appBarColor,
            elevation: 0,
            title: Text(
              buttonWithText[index]['text'],
            ),
          ),
          body: widget,
        ),
      ),
    );
  }
}
