

import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder{

  final child;

  CustomPageRoute({required this.child, }) : super(
    pageBuilder: (context, animation, secondaryAnimation){
      return child;
    }
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return ScaleTransition(
        scale: animation,
      child: child,
    );
  }

}