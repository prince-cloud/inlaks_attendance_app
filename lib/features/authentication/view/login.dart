import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/widgets/form_widget.dart';
import 'package:inlaks_attendance_app/core/widgets/generic_button.dart';
import 'package:inlaks_attendance_app/core/widgets/text_widgets.dart';
import 'package:inlaks_attendance_app/features/authentication/view/signup.dart';
import 'package:inlaks_attendance_app/main_page.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg-image.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 20,
          //   vertical: 20,
          // ),
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.genericWhite.withAlpha(490),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Inlaks.png',
                      width: 200,
                    ),
                    headingText(text: "Log In"),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GenericFormField(
                            controller: controller,
                            lableText: 'Email',
                            hintText: 'e.g pacheamnpong@inlaks.com',
                            prefixIcon: const Icon(
                              CupertinoIcons.mail_solid,
                            ),
                          ),
                          GenericFormField(
                            controller: controller,
                            lableText: 'Password',
                            hintText: '* * * *',
                            prefixIcon: const Icon(
                              CupertinoIcons.lock_circle_fill,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text('Forgot Password?')],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GenericButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                MainPage.id,
                              );
                            },
                            text: 'Continue',
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SignUpScreen.id,
                              );
                            },
                            child:
                                const Text('Don\'t have an account? Sign Up'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
