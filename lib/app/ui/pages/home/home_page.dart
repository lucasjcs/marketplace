import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Marketplace',
      body: Obx(
        () => Column(
          children: [
            Text('controller.count.toString()'),
            TextButton(
              onPressed: () {},
              child: Text('click here'),
            )
          ],
        ),
      ),
    );
  }
}
