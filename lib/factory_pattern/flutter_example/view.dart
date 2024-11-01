

import 'package:design_patterns/factory_pattern/flutter_example/abstract_factory_method.dart';
import 'package:design_patterns/factory_pattern/flutter_example/factory_method1.dart';
import 'package:flutter/material.dart';

class FactoryView extends StatelessWidget {
  const FactoryView({super.key});

  @override
  Widget build(BuildContext context) {

    final currPlatform = FactoryMethodForPlatformButton.getPlatformButton(Theme.of(context).platform);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          currPlatform.build(() {print('hi');}, Text('${Theme.of(context).platform}')),
          AbstractFactoryMethodImpl().buildButton(context, () { }, Text('data'),),
          AbstractFactoryMethodImpl().buildIndicator(context),
        ],
      ),
    );
  }
}