import 'package:flutter/material.dart';
import 'package:workshop/utils/textStyles.dart';
import 'package:workshop/widgets/customButton.dart';
import 'package:workshop/widgets/customTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 61,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Hero(
                        tag: 'logo',
                        child: Image(
                          image: AssetImage("assets/images/logo2.png"),
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Log In",
                    style: textStyle(
                      28,
                      Colors.black,
                      FontWeight.w600,
                      0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: textStyle(
                          16,
                          Colors.black,
                          FontWeight.w400,
                          0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: 'Enter your email',
                        controller: emailTEC,
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                        isPassword: false,
                        prefixIcon: Icons.email_outlined,
                        isEmail: true,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: textStyle(
                          16,
                          Colors.black,
                          FontWeight.w400,
                          0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: 'Enter your password',
                        controller: passwordTEC,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.visiblePassword,
                        isPassword: true,
                        prefixIcon: Icons.lock_outline,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                        activeColor: Colors.blueAccent,
                        value: isChecked,
                        onChanged: (value) => {
                          setState(() {
                            isChecked = value!;
                          })
                        },
                      ),
                      Text(
                        'Remember me',
                        style: textStyle(
                          14,
                          Colors.black,
                          FontWeight.w400,
                          0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Forgot Password?",
                        style: textStyle(
                          14,
                          Colors.black,
                          FontWeight.w400,
                          0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Hero(
                          tag: 'login',
                          child: CustomButton(
                            text: 'Sign In',
                            width: MediaQuery.of(context).size.width * 0.8,
                            onPressed: () {
                              if (emailTEC.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("Please enter email"),
                                  ),
                                );
                                return;
                              } else if (passwordTEC.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("Please enter password"),
                                  ),
                                );
                                return;
                              }
                            },
                            fontSize: 16,
                            color: Colors.blueAccent,
                            borderRadius: 8,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: CustomButton(
                            icon: Icons.fingerprint,
                            width: double.infinity,
                            onPressed: () {},
                            fontSize: 24,
                            color: Colors.blueAccent,
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "OR",
                          style: textStyle(
                            14,
                            Colors.black,
                            FontWeight.w400,
                            0,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    borderRadius: 8,
                    width: double.infinity,
                    onPressed: () {},
                    fontSize: 14,
                    prefixImage: "assets/images/apple.png",
                    text: "Login with Apple",
                    color: Colors.blueAccent,
                  ),
                  CustomButton(
                    borderRadius: 8,
                    width: double.infinity,
                    onPressed: () {},
                    fontSize: 14,
                    prefixImage: "assets/images/google.png",
                    text: "Login with Google",
                    color: Colors.blueAccent,
                  ),
                  CustomButton(
                    borderRadius: 8,
                    width: double.infinity,
                    onPressed: () {},
                    fontSize: 14,
                    prefixImage: "assets/images/facebook.png",
                    text: "Login with Facebook",
                    color: Colors.red,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: textStyle(
                          14,
                          Colors.black,
                          FontWeight.w400,
                          0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Register",
                          style: textStyle(
                            14,
                            Theme.of(context).primaryColor,
                            FontWeight.w600,
                            0,
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
    );
  }
}
