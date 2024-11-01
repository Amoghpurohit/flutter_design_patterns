
import 'package:design_patterns/factory_pattern/flutter_example/factory_method1.dart';
import 'package:design_patterns/factory_pattern/flutter_example/factory_method2.dart';
import 'package:flutter/material.dart';

abstract class AbstractFactoryMethod{           //this class will serve a factory class for other factory classes
  Widget buildButton(BuildContext context, VoidCallback onPressed, Widget child);
  Widget buildIndicator(BuildContext context);
}


class AbstractFactoryMethodImpl implements AbstractFactoryMethod{

  @override
  Widget buildButton(BuildContext context, VoidCallback onPressed, Widget child){
    //return FactoryMethodForPlatformButton.getPlatformButton(Theme.of(context).platform).build(() { }, Text('data'));     //OR next line
    return PlatformButton(Theme.of(context).platform).build(onPressed, child);
  }

  @override
  Widget buildIndicator(BuildContext context){
    return FactoryMethodForPlatformIndicator.getPlatformIndicator(Theme.of(context).platform).build();  //OR next line
    //return PlatformIndicator(Theme.of(context).platform).build();
  }
}