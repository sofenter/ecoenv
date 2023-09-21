import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color_constants.dart';

class SmallRegisterPage extends StatefulWidget {
  const SmallRegisterPage({super.key});

  @override
  State<SmallRegisterPage> createState() => _SmallRegisterPageState();
}

class _SmallRegisterPageState extends State<SmallRegisterPage> {
  // tapped on register btn
  bool isRegistered = false;

  // controller for text fields
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  TextEditingController? firstPasswordController;
  TextEditingController? secondPasswordController;

  // boolean for accept the conditions
  bool isAcceptCondition = false;

  // boolean for password visibility
  bool isShowPassword1 = true;
  bool isShowPassword2 = true;

  // register method
  Future<void> registerMethod({
    required TextEditingController fnameController,
    required TextEditingController lnameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController cnfpasswordController,
    required bool isConditionAccept,
  }) async {
    if (fnameController.text.isNotEmpty &&
        lnameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        cnfpasswordController.text.isNotEmpty) {
      // continue
      if (!isConditionAccept) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 1000),
              content: Text(
                "accept terms & conditions",
                style: TextStyle(),
              ),
            ),
          );
      } else {
        try {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: emailController.text.trim().toLowerCase(),
            password: passwordController.text.trim(),
          )
              .catchError((err) async {
                print(err);
            setState(() {
              isRegistered = false;
            });
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: Text(
                    "Email already in use",
                    style: TextStyle(),
                  ),
                ),
              );
          }).then((value) {
            setState(() {
              isRegistered = false;
            });
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: Text(
                    "Registration Success",
                    style: TextStyle(),
                  ),
                ),
              );
            fnameController.clear();
            lnameController.clear();
            emailController.clear();
            passwordController.clear();
            cnfpasswordController.clear();
            // go back to login page
            Navigator.pop(context);
          });
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 1000),
                content: Text(
                  "$e",
                  style: const TextStyle(),
                ),
              ),
            );
        }
      }
    } else {
      // show error
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 1000),
            content: Text(
              "Please enter valid credentials",
              style: TextStyle(),
            ),
          ),
        );
    }
  }

  Widget entryBox({
    required TextEditingController controller,
    required String? labelText,
    required String? hintText,
    required Icon prefixIcon,
    IconButton? suffixIconButton,
    required bool showPass,
    List<TextInputFormatter>? textFormat,
    TextInputType? textInputType,
  }) {
    return Material(
      color: AppColor.formFieldBgColor,
      child: SizedBox(
        height: 45,
        child: TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          keyboardType: textInputType,
          inputFormatters: textFormat,
          onChanged: (value) {
            controller.text = value;
          },
          obscureText: showPass,
          decoration: InputDecoration(
            fillColor: AppColor.formFieldBgColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIconButton,
            labelText: labelText,
            hintText: hintText,
            labelStyle: const TextStyle(
              fontSize: 12,
            ),
            hintStyle: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  // showing privacy policy website here
  // ignore: non_constant_identifier_names
  Widget show_Conditions_Policy({required String textData}) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
          color: AppColor.bottomSheetColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.drag_handle,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                textData,
              ),
            ),
          ],
        ),
      ),
    );
    return const SizedBox();
  }

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    firstPasswordController = TextEditingController();
    secondPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController!.dispose();
    lastNameController!.dispose();
    emailController!.dispose();
    firstPasswordController!.dispose();
    secondPasswordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 7,
          ),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hey there,",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                const Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                entryBox(
                  controller: firstNameController!,
                  textFormat: [
                    FilteringTextInputFormatter.deny(' '),
                    FilteringTextInputFormatter.deny('!'),
                    FilteringTextInputFormatter.deny('@'),
                    FilteringTextInputFormatter.deny('#'),
                    FilteringTextInputFormatter.deny('\$'),
                    FilteringTextInputFormatter.deny('%'),
                    FilteringTextInputFormatter.deny('^'),
                    FilteringTextInputFormatter.deny('&'),
                    FilteringTextInputFormatter.deny('*'),
                    FilteringTextInputFormatter.deny('('),
                    FilteringTextInputFormatter.deny(')'),
                    FilteringTextInputFormatter.deny('-'),
                    FilteringTextInputFormatter.deny('_'),
                  ],
                  textInputType: TextInputType.name,
                  showPass: false,
                  labelText: "First Name",
                  hintText: "First Name",
                  prefixIcon: const Icon(
                    Icons.person_outlined,
                    // size: 25,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                entryBox(
                  controller: lastNameController!,
                  textFormat: [
                    FilteringTextInputFormatter.deny(' '),
                    FilteringTextInputFormatter.deny('!'),
                    FilteringTextInputFormatter.deny('@'),
                    FilteringTextInputFormatter.deny('#'),
                    FilteringTextInputFormatter.deny('\$'),
                    FilteringTextInputFormatter.deny('%'),
                    FilteringTextInputFormatter.deny('^'),
                    FilteringTextInputFormatter.deny('&'),
                    FilteringTextInputFormatter.deny('*'),
                    FilteringTextInputFormatter.deny('('),
                    FilteringTextInputFormatter.deny(')'),
                    FilteringTextInputFormatter.deny('-'),
                    FilteringTextInputFormatter.deny('_'),
                  ],
                  textInputType: TextInputType.name,
                  showPass: false,
                  labelText: "Second Name",
                  hintText: "Second Name",
                  prefixIcon: const Icon(
                    Icons.person_outlined,
                    // size: 25,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                entryBox(
                  controller: emailController!,
                  showPass: false,
                  labelText: "Email",
                  hintText: "Enter Valid Email",
                  prefixIcon: const Icon(
                    Icons.email,
                    // size: 25,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                entryBox(
                  controller: firstPasswordController!,
                  showPass: isShowPassword1,
                  labelText: "Enter Password",
                  hintText: "Enter Password",
                  prefixIcon: const Icon(
                    Icons.lock,
                    // size: 25,
                  ),
                  suffixIconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword1 = !isShowPassword1;
                      });
                    },
                    icon: Icon(
                      isShowPassword1 ? Icons.visibility : Icons.visibility_off,
                      // size: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                entryBox(
                  controller: secondPasswordController!,
                  showPass: isShowPassword2,
                  labelText: "Enter Confirm Password",
                  hintText: "Enter Confirm Password",
                  prefixIcon: const Icon(
                    Icons.lock,
                    // size: 25,
                  ),
                  suffixIconButton: IconButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword2 = !isShowPassword2;
                      });
                    },
                    icon: Icon(
                      isShowPassword2 ? Icons.visibility : Icons.visibility_off,
                      // size: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isAcceptCondition,
                        onChanged: (val) {
                          setState(() {
                            isAcceptCondition = val!;
                          });
                        },
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isAcceptCondition = !isAcceptCondition;
                            });
                          },
                          child: SizedBox(
                            height: 50,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    "By creating an account, you agree to our ",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    show_Conditions_Policy(
                                      textData: "Show Conditions Here...",
                                    );
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      "Conditions To Use ",
                                      style: TextStyle(
                                        fontSize: 10,
                                        decoration: TextDecoration.underline,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    "& ",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    show_Conditions_Policy(
                                      textData: "Show Privacy Policy Here...",
                                    );
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      "Privacy Policy ",
                                      style: TextStyle(
                                        fontSize: 10,
                                        decoration: TextDecoration.underline,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Material(
                  color: isRegistered ? Colors.white : AppColor.mainColor,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    splashColor: AppColor.inkWellSplashColor,
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      setState(() {
                        isRegistered = true;
                      });
                      registerMethod(
                        fnameController: firstNameController!,
                        lnameController: lastNameController!,
                        emailController: emailController!,
                        passwordController: firstPasswordController!,
                        cnfpasswordController: secondPasswordController!,
                        isConditionAccept: isAcceptCondition,
                      );
                    },
                    child: isRegistered
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: 320,
                            height: 45,
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColor,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                const Text(
                  "EcoEnv",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account ?",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
