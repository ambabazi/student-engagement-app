import 'package:flutter/material.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

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
        title: const Text('Communities'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _CommunityCard(name: 'Design Club', members: '124 members', description: 'UI, UX, and product design meetups every week.'),
          const SizedBox(height: 12),
          _CommunityCard(name: 'Founders Hub', members: '87 members', description: 'For students building startups and side projects.'),
          const SizedBox(height: 12),
          _CommunityCard(name: 'Tech Talks', members: '203 members', description: 'Guest speakers, coding sessions, and workshops.'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _gold,
        foregroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CommunityCard extends StatelessWidget {
  final String name;
  final String members;
  final String description;

  const _CommunityCard({required this.name, required this.members, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF21262D)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFF5A623).withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.groups_rounded, color: Color(0xFFF5A623)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(members, style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 12)),
                const SizedBox(height: 8),
                Text(description, style: TextStyle(color: Colors.white.withOpacity(0.72), height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}