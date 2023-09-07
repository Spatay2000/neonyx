import 'package:flutter/material.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      body: Center(
        child: Text(
          'First',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
