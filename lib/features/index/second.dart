import 'package:flutter/material.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      body: Center(
        child: Text(
          'Second',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
