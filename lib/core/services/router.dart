// coverage:ignore-file
part of 'router.imports.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  return _customRoutes(settings);
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => Consumer<SessionState>(
      builder: (context, state, __) {
        final possibleAuthRoutes = [
          LoginScreen.id,
          SignUpScreen.id,
        ];
        if (state.isLoggedIn && !possibleAuthRoutes.contains(settings.name)) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            Future<void> recursive() async {
              if (!context.debugDoingBuild && context.mounted) {
                await Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.id,
                  (route) => false,
                  arguments: 'Session expired. Please login again.',
                );
              } else {
                debugPrint('Waiting for build to complete');
                var counter = 0;
                Timer.periodic(const Duration(seconds: 1), (timer) {
                  counter++;
                  if (counter > 2) {
                    recursive();
                    timer.cancel();
                  }
                });
              }
            }

            await recursive();
          });
          return const SizedBox();
        }
        return page;
      },
    ),
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
  );
}

PageRouteBuilder<dynamic> _customRoutes(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.id:
      return _pageBuilder(
        const LoginScreen(),
        settings: settings,
      );
    case SignUpScreen.id:
      return _pageBuilder(
        const SignUpScreen(),
        settings: settings,
      );
    case Dashboard.id:
      return _pageBuilder(
        const Dashboard(),
        settings: settings,
      );
    case MainPage.id:
      return _pageBuilder(
        const MainPage(),
        settings: settings,
      );
    case QrScanner.id:
      return _pageBuilder(
        const QrScanner(),
        settings: settings,
      );

    default:
      return _pageBuilder(
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: const Center(
            child: Text('Page Not Found'),
          ),
        ),
        settings: settings,
      );
  }
}
