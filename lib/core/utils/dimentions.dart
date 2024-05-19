// coverage:ignore-file

import 'package:inlaks_attendance_app/core/utils/constants.dart';

extension AdaptiveDimension<T extends num> on T {
  double adapt([double? width, double? height]) {
    assert(
      width != null || height != null,
      'Must give either the screen height or width',
    );
    assert(
      width == null || height == null,
      'Cannot give both the screen width and height, remove one of them and '
      'read the documentation for this method',
    );

    final operand = width ?? height!;
    if (operand == double.infinity) {
      throw IncorrectUseOfAdaptMethod(
        "Don't use adapt in a ListView or anything that asks for unbounded "
        'space',
      );
    }
    final factor = operand / this;
    return operand / factor;
  }

  /// Returns the percentage of the screen Height depending on the height used
  ///
  /// by the designer
  ///
  /// e.g if the designer used 50 as the height, this will divide 50 by the
  ///
  /// height of the screen model used by the designer and return the percentage
  ///
  /// of the screen height that is equivalent to 50
  double get adaptPercentHeight => this / kDesignHeight;

  /// Returns the percentage of the screen width to be used depending on the
  ///
  /// width used by the designer
  ///
  /// e.g if the designer used 50 as the width, this will divide 50 by the
  ///
  /// width of the screen model used by the designer and return the percentage
  ///
  /// of the screen width that is equivalent to 50
  double get adaptPercentWidth => this / kDesignWidth;

  /// Gets the [adaptPercentHeight] using provided [height]
  double adaptCustomPercentHeight(double height) => this / height;

  /// Gets the [adaptPercentHeight] using provided [width]
  double adaptCustomPercentWidth(double width) => this / width;
}

class IncorrectUseOfAdaptMethod implements Exception {
  IncorrectUseOfAdaptMethod(this.message);

  final String message;

  @override
  String toString() {
    return 'IncorrectUseOfAdaptMethod: $message';
  }
}
