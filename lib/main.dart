import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/event_details_screen.dart';
import 'screens/communities_screen.dart';
import 'screens/chats_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const ALUConnectApp());
}

class ALUConnectApp extends StatelessWidget {
  const ALUConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALU Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF5A623),
          surface: Color(0xFF161B22),
        ),
        fontFamily: 'SF Pro Display',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1C2333),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
        ),
      ),
      initialRoute: '/chats',
      routes: {
        '/': (context) => const MainShell(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/event-details': (context) => const EventDetailsScreen(),
        '/communities': (context) => const CommunitiesScreen(),
        '/chats': (context) => const ChatsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/create': (context) => const CreatePostScreen(),
      },
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ChatsScreen(),
    ExploreScreen(),
    CommunitiesScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFF5A623),
          onPressed: () => Navigator.pushNamed(context, '/create'),
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.black, size: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _BottomNav(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFF5A623);
    const inactive = Color(0xFF6B7280);

    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Color(0xFF161B22),
        border: Border(top: BorderSide(color: Color(0xFF21262D))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home_rounded, label: 'Home', index: 0, current: currentIndex, onTap: onTap, gold: gold, inactive: inactive),
          _NavItem(icon: Icons.explore_rounded, label: 'Explore', index: 1, current: currentIndex, onTap: onTap, gold: gold, inactive: inactive),
          const SizedBox(width: 56),
          _NavItem(icon: Icons.group_rounded, label: 'Community', index: 2, current: currentIndex, onTap: onTap, gold: gold, inactive: inactive),
          _NavItem(icon: Icons.person_rounded, label: 'Profile', index: 3, current: currentIndex, onTap: onTap, gold: gold, inactive: inactive),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int current;
  final ValueChanged<int> onTap;
  final Color gold;
  final Color inactive;

  const _NavItem({
    required this.icon, required this.label, required this.index,
    required this.current, required this.onTap, required this.gold, required this.inactive,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = current == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? gold : inactive, size: 22),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: isActive ? gold : inactive, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}