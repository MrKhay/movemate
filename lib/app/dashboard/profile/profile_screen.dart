import 'package:flutter/material.dart';
import 'package:movemate/shared/index.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kProfile,
          style: context.appBarTxt,
        ),
      ),
      body: Center(
        child: Text('No design specified'),
      ),
    );
  }
}
