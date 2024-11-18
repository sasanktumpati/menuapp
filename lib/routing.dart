import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/home_screen/ui/home_ui.dart';
import 'features/loading/ui/loading_ui.dart';
import 'services/connection_checker/connection_checker_notifier.dart';

final navigationProvider = Provider<GoRouter>((ref) {
  final connectivityState = ref.watch(connectionCheckerNotifierProvider);

  return GoRouter(
    redirect: (context, state) {
      if (connectivityState.isLoading) {
        return '/loading';
      }
      if (connectivityState.isConnected) {
        return '/';
      }
      return null;
    },
    initialLocation: '/loading',
    routes: [
      GoRoute(
          path: '/loading',
          builder: (context, state) {
            return LoadingScreen();
          }),
      GoRoute(
        path: '/',
        builder: (context, state) {
          return MenuScreen();
        },
      )
    ],
  );
});
