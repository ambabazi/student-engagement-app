import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const _bg = Color(0xFF0D1117);
  static const _gold = Color(0xFFF5A623);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: _gold.withOpacity(0.15),
                  child: const Icon(Icons.person_rounded, color: _gold, size: 40),
                ),
                const SizedBox(height: 12),
                const Text('Aline Uwase', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Product Designer • ALU', style: TextStyle(color: Colors.white.withOpacity(0.6))),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(child: _StatCard(label: 'Posts', value: '24')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(label: 'Followers', value: '1.2k')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(label: 'Communities', value: '8')),
            ],
          ),
          const SizedBox(height: 20),
          _MenuTile(icon: Icons.edit_outlined, title: 'Edit profile'),
          _MenuTile(icon: Icons.bookmark_border, title: 'Saved items'),
          _MenuTile(icon: Icons.notifications_none_rounded, title: 'Notifications'),
          _MenuTile(icon: Icons.settings_outlined, title: 'Settings'),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF21262D)),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 12)),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _MenuTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF21262D)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFF5A623)),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 15))),
          const Icon(Icons.chevron_right_rounded, color: Colors.white38),
        ],
      ),
    );
  }
}