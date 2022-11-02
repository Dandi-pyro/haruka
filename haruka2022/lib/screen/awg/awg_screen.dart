import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AwgScreen extends StatelessWidget {
  const AwgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AWG'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('This is AWG'),
      ),
    );
  }
}
