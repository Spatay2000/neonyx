import 'package:flutter/material.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NeoScaffold(
      body: Center(
        child: Text(
          'Third',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
