import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:po_app/responsive_layout.dart';
import 'package:po_app/small_android_device/small_home_page.dart';
import 'package:po_app/small_android_device/small_register.dart';
import 'package:po_app/tab_android_device/tab_home_page.dart';
import 'package:po_app/tab_android_device/tab_register.dart';
import 'package:email_validator/email_validator.dart';

import '../constants/color_constants.dart';

class SmallLoginPage extends StatefulWidget {
  const SmallLoginPage({super.key});

  @override
  State<SmallLoginPage> createState() => _SmallLoginPageState();
}

class _SmallLoginPageState extends State<SmallLoginPage> {
  final formKey = GlobalKey<FormState>();

  // controllers for textfield
  TextEditingController? emailController;
  TextEditingController? passwordController;

  // boolean for password visibility
  bool isShowPassword = true;

  // tapped on login
  bool isLoggedIn = false;

  // login method
  Future signIn({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (EmailValidator.validate(emailController.text)) {
        // continue
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
            email: emailController.text.trim().toLowerCase(),
            password: passwordController.text.trim(),
          )
              .then((value) {
            setState(() {
              isLoggedIn = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ResponsiveLayout(
                  mobileScreen: SmallHomePage(),
                  tabletScreen: TabHomePage(),
                ),
              ),
            );
          });

          // clear entry boxes
          emailController.clear();
          passwordController.clear();
        } on FirebaseAuthException catch (e) {
          setState(() {
            isLoggedIn =false;
          });
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 1000),
                content: Text(
                  "Please Check Your Email or Password",
                  style: TextStyle(),
                ),
              ),
            );
        }
      } else {
        setState(() {
          isLoggedIn = false;
        });
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 1000),
              content: Text(
                "Please Enter Valid Email",
                style: TextStyle(),
              ),
            ),
          );
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
    String? Function(String?)? validator,
    Iterable<String>? autofillHints,
    TextInputType? keyboardType,
  }) {
    return Material(
      color: AppColor.formFieldBgColor,
      child: SizedBox(
        height: 45,
        child: TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          controller: controller,
          obscureText: showPass,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          autofillHints: autofillHints,
          keyboardType: keyboardType,
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

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    entryBox(
                      controller: emailController!,
                      autofillHints: [AutofillHints.email],
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        email != null && EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null;
                      },
                      showPass: false,
                      labelText: "Email",
                      hintText: "Email",
                      prefixIcon: const Icon(
                        Icons.email,
                        // size: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    entryBox(
                      controller: passwordController!,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        value != null && value.length < 6
                            ? 'Enter min. 6 characters'
                            : null;
                      },
                      showPass: isShowPassword,
                      labelText: "Password",
                      hintText: "Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        // size: 25,
                      ),
                      suffixIconButton: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        icon: Icon(
                          isShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          // size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      child: const Text(
                        "Forgot your password ?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Material(
                      color: isLoggedIn ? Colors.white : AppColor.mainColor,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        splashColor: AppColor.inkWellSplashColor,
                        borderRadius: BorderRadius.circular(8),
                        onTap: isLoggedIn
                            ? null
                            : () {
                                setState(() {
                                  isLoggedIn = true;
                                });
                                signIn(
                                  emailController: emailController!,
                                  passwordController: passwordController!,
                                );
                              },
                        child: isLoggedIn
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: 200,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    "Login",
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
                      height: 70,
                    ),
                    const Text(
                      "EcoEnv",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account yet ?",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ResponsiveLayout(
                                  mobileScreen: SmallRegisterPage(),
                                  tabletScreen: TabRegisterPage(),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Register",
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
        ),
      ),
    );
  }
}
