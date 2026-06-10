import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  
  static const _bg = Color(0xFF0D1117);        
  static const _card = Color(0xFF161B22);       
  static const _gold = Color(0xFFF5A623);       
  static const _border = Color(0xFF21262D);     

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
                // Profile picture circle
                CircleAvatar(
                  radius: 44,
                  backgroundColor: _gold.withOpacity(0.15),
                  child: const Icon(Icons.person_rounded, color: _gold, size: 40),
                ),
                const SizedBox(height: 12),
                
                // User name
                const Text(
                  'Angel Kibui',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                
                // Role / program
                Text(
                  'Software Dev • Year 2 • ALU',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                
                // Bio text
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

          // ═══════════════════════════════════════
          // SECTION 2: Stats Row (Posts / Followers / Communities)
          // ═══════════════════════════════════════
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

          // ═══════════════════════════════════════
          // SECTION 3: "My Activity" Header
          // ═══════════════════════════════════════
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

          // ═══════════════════════════════════════
          // SECTION 4: Event Cards (Events I'm Attending)
          // ═══════════════════════════════════════
          _EventCard(
            title: 'Tech Founders Mixer',
            date: 'Jun 15 • 6:00 PM',
            location: 'The Leadership Lab',
            tag: 'Attending',
          ),
          const SizedBox(height: 10),
          _EventCard(
            title: 'Figma Workshop: Advanced',
            date: 'Jun 20 • 2:00 PM',
            location: 'Innovation Hub',
            tag: 'Registered',
          ),

          const SizedBox(height: 24),

          // ═══════════════════════════════════════
          // SECTION 5: Menu Items
          // ═══════════════════════════════════════
          const _MenuTile(
            icon: Icons.edit_outlined,
            title: 'Edit Profile',
          ),
          const _MenuTile(
            icon: Icons.bookmark_border,
            title: 'Saved Items',
          ),
          const _MenuTile(
            icon: Icons.notifications_none_rounded,
            title: 'Notifications',
          ),
          const _MenuTile(
            icon: Icons.group_outlined,
            title: 'My Communities',
          ),
          const _MenuTile(
            icon: Icons.help_outline_rounded,
            title: 'Help & Support',
          ),
          const _MenuTile(
            icon: Icons.logout_rounded,
            title: 'Log Out',
            isDestructive: true,
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// WIDGET 1: StatCard - The little boxes showing numbers
// ═══════════════════════════════════════════════════════════════
class _StatCard extends StatelessWidget {
  final String label;   // e.g., "Posts"
  final String value;   // e.g., "12"

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        // color: _card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF21262D)),
      ),
      child: Column(
        children: [
          // The number
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // The label below the number
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

// ═══════════════════════════════════════════════════════════════
// WIDGET 2: EventCard - Shows events user is attending
// ═══════════════════════════════════════════════════════════════
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
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF21262D)),
      ),
      child: Row(
        children: [
          // Calendar icon in a gold circle
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF5A623).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_today_rounded,
              color: Color(0xFFF5A623),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          
          // Event details
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
          
          // Tag pill (e.g., "Attending")
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

// ═══════════════════════════════════════════════════════════════
// WIDGET 3: MenuTile - Row items like "Edit Profile", "Saved"
// ═══════════════════════════════════════════════════════════════
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
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF21262D)),
      ),
      child: Row(
        children: [
          // Icon
          Icon(
            icon,
            color: isDestructive
                ? const Color(0xFFEF4444)  // Red for logout
                : const Color(0xFFF5A623),  // Gold for everything else
          ),
          const SizedBox(width: 12),
          
          // Title text
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isDestructive
                    ? const Color(0xFFEF4444)  // Red text for logout
                    : Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          
          
          const Icon(
            Icons.chevron_right_rounded,
            color: Colors.white38,
          ),
        ],
      ),
    );
  }
}