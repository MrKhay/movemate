import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:movemate/shared/index.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({super.key});

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  double _amount = 400;

  @override
  void initState() {
    super.initState();
    Future.delayed(100.ms, () {
      setState(() {
        _amount = 1460;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),

              // Package icon
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.8, end: 1.0),
                duration: 500.ms,
                curve: Curves.easeOutBack,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Image.asset(
                  Assets.box,
                  height: 130,
                  width: 130,
                )
                    .animate()
                    .fadeIn(duration: 300.ms)
                    .slideY(begin: 0.4, end: 0, duration: 400.ms),
              ),

              SizedBox(height: 24),

              // Total Estimated Amount
              Text(
                'Total Estimated Amount',
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: context.padding1),

              AnimatedFlipCounter(
                duration: 500.ms,
                value: _amount,
                suffix: " USD",
                thousandSeparator: ',',
                textStyle: context.headlineSmall.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF28A745),
                ),
              ),

              SizedBox(height: context.padding2),

              // Disclaimer text
              Text(
                'This amount is estimated this will vary\nif you change your location or weight',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: context.txtGray,
                ),
              ),
              SizedBox(height: context.padding5),

              // Back to home button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go(UserRoute.home);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kOrange,
                    padding: EdgeInsets.symmetric(vertical: context.padding2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.padding4),
                    ),
                  ),
                  child: Text(
                    'Back to home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
