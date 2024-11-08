import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  NavigationService.push(
      {required BuildContext context, required Widget page}) {
    NavigationService.Cupertino(context: context, page: page);
  }

  NavigationService.pushRemoveAll({
    required BuildContext context,
    required Widget page,
  }) {
    NavigationService.cupertinoRemoveAll(context: context, page: page);
  }

  NavigationService.Cupertino({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  NavigationService.material({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  NavigationService.materialRemoveAll({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  NavigationService.cupertinoRemoveAll({
    required BuildContext context,
    required Widget page,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  NavigationService.closePage(BuildContext context) {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
