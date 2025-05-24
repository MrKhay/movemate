import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movemate/shared/index.dart';
import '../../index.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  bool isCheckout = false;
  String _selectedPackaging = 'Box';
  final List<String> _packagingOptions = ['Box', 'Envelope', 'Pallet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: context.theme.iconTheme
            .copyWith(color: context.colorScheme.onPrimary),
        title: Text(
          'Calculate',
          style:
              context.appBarTxt.copyWith(color: context.colorScheme.onPrimary),
        ).animate().slideY(
            begin: 0.5,
            end: 0.0,
            duration: 300.ms,
            curve: Curves.decelerate,
            delay: 100.ms),
        backgroundColor: context.colorScheme.primary,
        elevation: 0,
      ),
      body: isCheckout
          ? CheckoutWidget()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DestinationSection()
                      .animate()
                      .fadeIn()
                      .slideY(begin: 0.1),
                  const SizedBox(height: 24),
                  PackagingSection(
                    selectedPackaging: _selectedPackaging,
                    packagingOptions: _packagingOptions,
                    onChanged: (val) =>
                        setState(() => _selectedPackaging = val),
                  ).animate().fadeIn().slideY(begin: 0.1),
                  const SizedBox(height: 24),
                  const CategorySection().animate().fadeIn().slideX(begin: 0.2),
                  const SizedBox(height: 24),
                  CalculateButton(
                    onTap: () {
                      setState(() {
                        isCheckout = true;
                      });
                    },
                  ).animate().fadeIn().slideY(begin: 0.2),
                ],
              ),
            ),
    );
  }
}

class CalculateButton extends StatelessWidget {
  final void Function()? onTap;
  const CalculateButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF8C00),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: const Text(
          'Calculate',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
