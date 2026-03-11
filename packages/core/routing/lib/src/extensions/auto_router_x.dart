import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

extension AutoRouterX on BuildContext {
  StackRouter get router => AutoRouter.of(this);

  TabsRouter get tabsRouter => AutoTabsRouter.of(this);
}
