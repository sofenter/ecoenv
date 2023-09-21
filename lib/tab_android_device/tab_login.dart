import 'package:flutter/material.dart';

class TabLoginPage extends StatefulWidget {
  const TabLoginPage({super.key});

  @override
  State<TabLoginPage> createState() => _TabLoginPageState();
}

class _TabLoginPageState extends State<TabLoginPage> {
  // Widget entryBox({
  //   required String? labelText,
  //   required String? hintText,
  //   required Icon prefixIcon,
  //   IconButton? suffixIconButton,
  // }) {
  //   return Material(
  //     color: const Color(0xffF6EDED),
  //     child: TextFormField(
  //       decoration: InputDecoration(
  //         fillColor: const Color(0xffF6EDED),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //         prefixIcon: prefixIcon,
  //         suffixIcon: suffixIconButton,
  //         labelText: labelText,
  //         hintText: hintText,
  //         labelStyle: const TextStyle(
  //           fontSize: 20,
  //         ),
  //         hintStyle: const TextStyle(
  //           fontSize: 20,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 14),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             const Text(
  //               "Hey there,",
  //               style: TextStyle(
  //                 fontSize: 24,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 19,
  //             ),
  //             const Text(
  //               "Welcome Back",
  //               style: TextStyle(
  //                 fontSize: 32,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 71,
  //             ),
  //             entryBox(
  //               labelText: "Email",
  //               hintText: "Email",
  //               prefixIcon: const Icon(
  //                 Icons.email,
  //                 // size: 52,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 32,
  //             ),
  //             entryBox(
  //               labelText: "Password",
  //               hintText: "Password",
  //               prefixIcon: const Icon(
  //                 Icons.lock,
  //                 // size: 52,
  //               ),
  //               suffixIconButton: IconButton(
  //                 onPressed: () {},
  //                 icon: const Icon(
  //                   Icons.visibility,
  //                   // size: 50,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             TextButton(
  //               child: const Text(
  //                 "Forgot your password ?",
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               onPressed: () {},
  //             ),
  //             const SizedBox(
  //               height: 132,
  //             ),
  //             Material(
  //               color: Colors.indigo,
  //               borderRadius: BorderRadius.circular(8),
  //               child: InkWell(
  //                 splashColor: Colors.lightBlueAccent[400],
  //                 borderRadius: BorderRadius.circular(8),
  //                 onTap: () {},
  //                 child: const SizedBox(
  //                   width: 420,
  //                   height: 95,
  //                   child: Center(
  //                     child: Text(
  //                       "Login",
  //                       style: TextStyle(
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 102,
  //             ),
  //             const Text(
  //               "App_Name",
  //               style: TextStyle(
  //                 fontSize: 36,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 16,
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 const Text(
  //                   "Don’t have an account yet ? ",
  //                   style: TextStyle(
  //                     fontSize: 24,
  //                   ),
  //                 ),
  //                 TextButton(
  //                   onPressed: () {},
  //                   child: const Text(
  //                     "Register",
  //                     style: TextStyle(
  //                       fontSize: 24,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
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
