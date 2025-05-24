import 'package:flutter/material.dart';

extension AnimationExtension on Widget {
  Widget bounce({
    Duration duration = const Duration(milliseconds: 280),
    double scaleFactor = 1.02,
    double verticalTranslate = -1.0,
  }) {
    return _BounceWrapper(
      duration: duration,
      scaleFactor: scaleFactor,
      verticalTranslate: verticalTranslate,
      child: this,
    );
  }
}

class _BounceWrapper extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scaleFactor;
  final double verticalTranslate;

  const _BounceWrapper({
    required this.child,
    required this.duration,
    required this.scaleFactor,
    required this.verticalTranslate,
  });

  @override
  _BounceWrapperState createState() => _BounceWrapperState();
}

class _BounceWrapperState extends State<_BounceWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    // Using a different curve for better bounce effect
    final scaleCurvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: widget.scaleFactor)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.scaleFactor, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
    ]).animate(scaleCurvedAnimation);

    // Separate curved animation for translate
    final translateCurvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _translateAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: widget.verticalTranslate)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: widget.verticalTranslate, end: 0.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
    ]).animate(translateCurvedAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  VoidCallback? _wrapCallback(VoidCallback? originalCallback) {
    return originalCallback == null
        ? null
        : () {
            if (!_controller.isAnimating) {
              _controller.forward(from: 0.0).then((_) {
                if (mounted) {
                  _controller.reset();
                }
              });
            }
            originalCallback();
          };
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..scale(_scaleAnimation.value)
            ..translate(0.0, _translateAnimation.value),
          alignment: Alignment.center,
          child: child,
        );
      },
      child: _wrapChild(widget.child),
    );
  }

  Widget _wrapChild(Widget child) {
    if (child is FilledButton) {
      return FilledButton(
        onPressed: _wrapCallback(child.onPressed),
        style: child.style,
        child: child.child,
      );
    } else if (child is ElevatedButton) {
      return ElevatedButton(
        onPressed: _wrapCallback(child.onPressed),
        style: child.style,
        child: child.child,
      );
    } else if (child is TextButton) {
      return TextButton(
        onPressed: _wrapCallback(child.onPressed),
        style: child.style,
        child: child.child ?? const SizedBox.shrink(),
      );
    } else if (child is OutlinedButton) {
      return OutlinedButton(
        onPressed: _wrapCallback(child.onPressed),
        style: child.style,
        child: child.child,
      );
    }
    return child;
  }
}
