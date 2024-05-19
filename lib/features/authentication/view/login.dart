import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/chache/local_cache.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/widgets/error_dialogue.dart';
import 'package:inlaks_attendance_app/core/widgets/form_widget.dart';
import 'package:inlaks_attendance_app/core/widgets/generic_button.dart';
import 'package:inlaks_attendance_app/core/widgets/loading_widget.dart';
import 'package:inlaks_attendance_app/core/widgets/success_pop_up.dart';
import 'package:inlaks_attendance_app/core/widgets/text_widgets.dart';
import 'package:inlaks_attendance_app/features/authentication/data/models/user_model.dart';
import 'package:inlaks_attendance_app/features/authentication/data/repository/auth_repository.dart';
import 'package:inlaks_attendance_app/features/authentication/provider/auth_provider.dart';
import 'package:inlaks_attendance_app/features/authentication/view/signup.dart';
import 'package:inlaks_attendance_app/main_page.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                            controller: emailController,
                            lableText: 'Work Email',
                            hintText: 'e.g pacheamnpong@inlaks.com',
                            prefixIcon: const Icon(
                              CupertinoIcons.mail_solid,
                            ),
                          ),
                          GenericFormField(
                            controller: passwordController,
                            lableText: 'Password',
                            hintText: '* * * *',
                            prefixIcon: const Icon(
                              CupertinoIcons.lock_circle_fill,
                            ),
                            obscure: true,
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
                            onPressed: () async {
                              toggleIsLoading(context, true);
                              try {
                                final response =
                                    await AuthenticationRepository.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );

                                if (response.containsKey('access')) {
                                  if (!context.mounted) return;
                                  AuthProvider authProvider =
                                      context.read<AuthProvider>();
                                  authProvider.logIn(
                                    token: response["access"] as String,
                                    isLoggedIn: true,
                                    user: User.fromMap(
                                      response['user'] as Map<String, dynamic>,
                                    ),
                                  );

                                  LocalCache.setAuthData(response);
                                  secureStorage.write(
                                    key: "loggedInBefore",
                                    value: true.toString(),
                                  );

                                  toggleIsLoading(context, false);

                                  Navigator.pushNamed(
                                    context,
                                    MainPage.id,
                                  );
                                  showSuccessPopUp(
                                    content: "Succesffully loged In.",
                                    context: context,
                                    position: FlushbarPosition.TOP,
                                  );
                                  return;
                                } else {
                                  if (!context.mounted) return;

                                  toggleIsLoading(context, false);

                                  response.forEach((key, value) {
                                    if (!mounted) return;
                                    showErrorPopUp(
                                        value[0].toString(), context);
                                  });
                                }
                              } catch (e) {
                                if (!context.mounted) return;
                                toggleIsLoading(context, false);

                                if (!mounted) return;
                                showErrorPopUp("An error occured", context);
                              }
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
