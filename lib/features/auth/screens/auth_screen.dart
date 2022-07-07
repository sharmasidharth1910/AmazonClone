import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      email: _emailController.text,
      context: context,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      email: _emailController.text,
      context: context,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hint: "Name",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          hint: "Email",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hint: "Password",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomButton(
                          text: "Sign Up",
                          onTap: () {
                            if (_signupFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Sign-In.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signinFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hint: "Email",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hint: "Password",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomButton(
                          text: "Sign In",
                          onTap: () {
                            if (_signinFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
