import 'package:go_router/go_router.dart';

import 'features/home_screen/ui/home_ui.dart';

final navigationRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return MenuScreen();
      },
    )
  ],
);
