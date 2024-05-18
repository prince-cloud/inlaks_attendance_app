import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/widgets/form_widget.dart';
import 'package:inlaks_attendance_app/core/widgets/generic_button.dart';
import 'package:inlaks_attendance_app/core/widgets/text_widgets.dart';
import 'package:inlaks_attendance_app/features/authentication/view/login.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = '/singup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        body: ListView(
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 20,
          //   vertical: 20,
          // ),
          children: [
            Container(
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
                children: [
                  Image.asset(
                    'assets/images/Inlaks.png',
                    width: 200,
                  ),
                  headingText(text: "Sign Up"),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GenericFormField(
                                controller: controller,
                                lableText: 'First Name',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GenericFormField(
                                controller: controller,
                                lableText: 'Last Name',
                              ),
                            ),
                          ],
                        ),
                        GenericFormField(
                          controller: controller,
                          lableText: 'Email',
                          hintText: 'e.g pacheamnpong@inlaks.com',
                        ),
                        GenericFormField(
                          controller: controller,
                          lableText: 'Phone Number',
                          hintText: '0243 186 008',
                        ),
                        GenericFormField(
                          lableText: 'Country',
                          suffixIcon: const Icon(
                            Icons.arrow_right_outlined,
                          ),
                          controller: controller,
                          enabled: false,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GenericFormField(
                                lableText: 'Department',
                                suffixIcon: const Icon(
                                  Icons.arrow_right_outlined,
                                ),
                                controller: controller,
                                enabled: false,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GenericFormField(
                                lableText: 'Unit',
                                suffixIcon: const Icon(
                                  Icons.arrow_right_outlined,
                                ),
                                controller: controller,
                                enabled: false,
                              ),
                            ),
                          ],
                        ),
                        GenericFormField(
                          controller: controller,
                          lableText: 'Role',
                          hintText: 'eg. Software Developer',
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GenericButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              LoginScreen.id,
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
                              LoginScreen.id,
                            );
                          },
                          child: const Text('Already have an account? Login'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // bottomSheet: GenericButton(
        //   onPressed: () {},
        //   text: 'Continue',
        // ),
      ),
    );
  }
}
