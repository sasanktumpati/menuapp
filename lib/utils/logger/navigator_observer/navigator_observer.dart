import 'package:flutter/material.dart';

import '../log_tags.dart';
import '../logger.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugLog(
      LogTags.navigatorObserver,
      "New route pushed: ${route.settings.name}",
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugLog(
      LogTags.navigatorObserver,
      "Route popped: ${route.settings.name}",
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugLog(
      LogTags.navigatorObserver,
      'Route removed: ${route.settings.name}',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugLog(
      LogTags.navigatorObserver,
      'Route replaced: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}',
    );
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugLog(
      LogTags.navigatorObserver,
      'User gesture started on route: ${route.settings.name}',
    );
  }

  @override
  void didStopUserGesture() {
    debugLog(
      LogTags.navigatorObserver,
      ('User gesture stopped'),
    );
  }
}
