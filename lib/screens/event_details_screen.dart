import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

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
        title: const Text('Event details'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: _card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _border),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1E293B), Color(0xFF111827)],
              ),
            ),
            child: const Center(
              child: Icon(Icons.event_rounded, color: Colors.white24, size: 72),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Pitch Night: Innovation in Kigali', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Oct 24, 2023 • The Leadership Lab', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _Tag(label: 'Featured'),
              _Tag(label: 'Kigali'),
              _Tag(label: 'Startup'),
            ],
          ),
          const SizedBox(height: 20),
          _SectionCard(
            title: 'About',
            child: Text(
              'Join student founders, mentors, and investors for an evening of ideas, demos, and networking.',
              style: TextStyle(color: Colors.white.withOpacity(0.72), height: 1.5),
            ),
          ),
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Schedule',
            child: Column(
              children: const [
                _TimelineItem(title: '6:00 PM', subtitle: 'Arrival and check-in'),
                _TimelineItem(title: '6:30 PM', subtitle: 'Opening keynote'),
                _TimelineItem(title: '7:15 PM', subtitle: 'Founder pitches'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _gold,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () {},
              child: const Text('Register now', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF21262D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;

  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFF21262D)),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const _TimelineItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Color(0xFFF5A623), fontWeight: FontWeight.w600)),
          const SizedBox(width: 14),
          Expanded(child: Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.72)))),
        ],
      ),
    );
  }
}