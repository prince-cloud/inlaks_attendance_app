// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/dimentions.dart';

class SpinningLoader extends StatelessWidget {
  /// Creates a Custom Loading Widget
  ///
  /// Example Usage: Used in the [ILoader]
  const SpinningLoader({
    super.key,
    this.loadingText = 'Loading...',
    this.successText = 'Success!',
    this.success = false,
  });

  final String loadingText;
  final String successText;
  final bool success;

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Container(
            key: UniqueKey(),
            height: 200.adapt(cs.height),
            width: 200.adapt(cs.width),
            padding: EdgeInsets.all(20.adapt(cs.width)),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(20.adapt(cs.width)),
              color: Colors.white,
            ),
            child: !success
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator.adaptive(),
                      SizedBox(height: 20.adapt(cs.height)),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          loadingText,
                          style: TextStyle(
                            fontSize: 20.adapt(cs.height),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50,
                      ),
                      SizedBox(height: 20.adapt(cs.height)),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          successText,
                          style: TextStyle(
                            fontSize: 20.adapt(cs.height),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
