import 'package:flutter/material.dart';
import '../../components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Marketplace',
      body: Container(
        child: Text('oiee'),
      ),
    );
  }
}