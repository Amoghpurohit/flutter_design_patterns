

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButton{
  Widget build(VoidCallback onPressed, Widget child);
  factory PlatformButton(TargetPlatform platform){
    switch(platform){
      case TargetPlatform.android:
      return AndroidButton();
      case TargetPlatform.iOS:
      return IOSButton();
      default: return AndroidButton();
    }
  }
}

class AndroidButton implements PlatformButton{
  @override 
  Widget build(VoidCallback onPressed, Widget child){
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class IOSButton implements PlatformButton{
  @override
  Widget build(VoidCallback onPressed, Widget child){
    return CupertinoButton.filled(onPressed: onPressed, child: child);
  }
}

class FactoryMethodForPlatformButton{
  static PlatformButton getPlatformButton(TargetPlatform platform){              //TargetPlatform is a enum which can be used to get the env on which the use is using the application
    switch(platform){
      case TargetPlatform.android:
      return AndroidButton();
      case TargetPlatform.iOS:
      return IOSButton();
      default: return AndroidButton();
    }
  }
}