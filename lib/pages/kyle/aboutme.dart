import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Kyle Netterville'),
    ),
    body: const Center(
      child: Text('I love to build apps & learn new things'),
    ),

    );
  }
}