import 'package:flutter/material.dart';

const _bg = Color(0xFF0D1117);
const _card = Color(0xFF161B22);
const _gold = Color(0xFFF5A623);
const _border = Color(0xFF21262D);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        elevation: 0,
        title: const Text(
          'ALU Connect',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.white70),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: _gold, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: _card,
                    child: const Icon(Icons.person_rounded, color: _gold, size: 40),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Aline Umuhoza',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Kigali Campus',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Row(
            children: const [
              Expanded(child: _StatCard(label: 'Events', value: '23')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(label: 'Communities', value: '5')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(label: 'Connections', value: '87')),
            ],
          ),

          const SizedBox(height: 32),

          const _MenuTile(icon: Icons.article_outlined, title: 'My Posts'),
          const _MenuTile(icon: Icons.bookmark_border, title: 'Saved'),
          const _MenuTile(icon: Icons.notifications_none_rounded, title: 'Notifications'),
          const _MenuTile(icon: Icons.settings_outlined, title: 'Account Settings'),
          const _MenuTile(icon: Icons.help_outline_rounded, title: 'Help & Support'),
          
          const SizedBox(height: 8),
          
          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout_rounded, color: Colors.white54, size: 18),
              label: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
            ),
          ),
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
        // color: _card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.55),
              fontSize: 12,
            ),
          ),
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
        color: _card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Colors.white38),
        ],
      ),
    );
  }
}