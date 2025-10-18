import 'package:flutter/material.dart';

class BrandScreen extends StatelessWidget {
  final String category;
  const BrandScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Brand Screen')),
    );
  }
}
