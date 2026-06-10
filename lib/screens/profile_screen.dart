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
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Profile'),
        actions: [
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
                CircleAvatar(
                  radius: 44,
                  backgroundColor: _gold.withOpacity(0.15),
                  child: const Icon(Icons.person_rounded, color: _gold, size: 40),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Angel Kibui',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Software Dev • Year 2 • ALU',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Building tech for African communities.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.45),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          
          Row(
            children: const [
              Expanded(child: _StatCard(label: 'Posts', value: '12')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(label: 'Followers', value: '348')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(label: 'Events', value: '5')),
            ],
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Activity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: _gold,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Event Cards
          const _EventCard(
            title: 'Tech Founders Mixer',
            date: 'Jun 15 • 6:00 PM',
            location: 'The Leadership Lab',
            tag: 'Attending',
          ),
          const SizedBox(height: 10),
          const _EventCard(
            title: 'Figma Workshop: Advanced',
            date: 'Jun 20 • 2:00 PM',
            location: 'Innovation Hub',
            tag: 'Registered',
          ),

          const SizedBox(height: 24),

          // Menu Items
          const _MenuTile(icon: Icons.edit_outlined, title: 'Edit Profile'),
          const _MenuTile(icon: Icons.bookmark_border, title: 'Saved Items'),
          const _MenuTile(icon: Icons.notifications_none_rounded, title: 'Notifications'),
          const _MenuTile(icon: Icons.group_outlined, title: 'My Communities'),
          const _MenuTile(icon: Icons.help_outline_rounded, title: 'Help & Support'),
          const _MenuTile(icon: Icons.logout_rounded, title: 'Log Out', isDestructive: true),
        ],
      ),
    );
  }
}

// Stat Card Widget
class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
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

// Event Card Widget
class _EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String tag;

  const _EventCard({
    required this.title,
    required this.date,
    required this.location,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _gold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_today_rounded,
              color: _gold,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$date • $location',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tag,
              style: const TextStyle(
                color: Color(0xFF10B981),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Menu Tile Widget
class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDestructive;

  const _MenuTile({
    required this.icon,
    required this.title,
    this.isDestructive = false,
  });

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
          Icon(
            icon,
            color: isDestructive ? const Color(0xFFEF4444) : _gold,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isDestructive ? const Color(0xFFEF4444) : Colors.white,
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