import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/fetch_menu.dart';
import 'widgets/menu_content.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  int _currentIndex = 0;

  Future<void> _handleRefresh() async {
    await ref.refresh(fetchMenuServiceProvider.notifier).fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    final menuState = ref.watch(fetchMenuServiceProvider);
    final menuList = menuState.menuList ?? [];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          RefreshIndicator(
            onRefresh: _handleRefresh,
            displacement: 100,
            color: Colors.orangeAccent,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  expandedHeight: 150,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Mess Menu',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ), // Removed Flexible widget
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor,
                            Colors.orangeAccent
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (menuState.isLoading)
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (menuState.hasError)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              menuState.errorMessage.toString(),
                              style: GoogleFonts.poppins(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () =>
                                ref.refresh(fetchMenuServiceProvider),
                            child: Text('Retry', style: GoogleFonts.poppins()),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  MenuContent(menuList: menuList),
              ],
            ),
          ),
          Center(
            child: Text(
              'Favorites - Coming Soon',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              'Alerts - Coming Soon',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
        ],
      ),
    );
  }
}
