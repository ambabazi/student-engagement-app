import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const _bg = Color(0xFF0D1117);
  static const _card = Color(0xFF161B22);
  static const _gold = Color(0xFFF5A623);
  static const _border = Color(0xFF21262D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverToBoxAdapter(child: _buildSearchBar()),
            SliverToBoxAdapter(child: _buildFilterChips()),
            SliverToBoxAdapter(child: _buildFeaturedEvent(context)),
            SliverToBoxAdapter(child: _buildSectionHeader('Latest Opportunities', 'See all')),
            SliverList(
              delegate: SliverChildListDelegate([
                _buildOpportunityTile(
                  icon: Icons.emoji_events_rounded,
                  tag: 'COMPETITION',
                  tagColor: const Color(0xFF7C3AED),
                  title: 'Hult Prize Challenge 2024',
                  subtitle: 'Solve global food security issues...',
                ),
                _buildOpportunityTile(
                  icon: Icons.calendar_today_rounded,
                  tag: 'EVENT',
                  tagColor: const Color(0xFF0EA5E9),
                  title: 'Tech Founders Mixer',
                  subtitle: 'Networking with local Kigali CEOs',
                ),
                _buildOpportunityTile(
                  icon: Icons.school_rounded,
                  tag: 'WORKSHOP',
                  tagColor: const Color(0xFF10B981),
                  title: 'Advanced UI Design with Figma',
                  subtitle: 'Master design systems and tokens',
                ),
                const SizedBox(height: 100),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back,', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13)),
              const Text('Hi, Aline 👋', style: TextStyle(color: _gold, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              _IconButton(icon: Icons.notifications_none_rounded, onTap: () {}),
              const SizedBox(width: 10),
              const CircleAvatar(radius: 18, backgroundColor: _card),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _border),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.white.withOpacity(0.3), size: 20),
            const SizedBox(width: 10),
            Text('Search opportunities, events, people...', style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    const filters = ['All', 'Events', 'Opportunities', 'Clubs'];
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final active = i == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              color: active ? _gold : _card,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: active ? _gold : _border),
            ),
            child: Text(filters[i], style: TextStyle(color: active ? Colors.black : Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedEvent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
              height: 210,
              color: const Color(0xFF1A2030),
              child: const Center(child: Icon(Icons.image_rounded, color: Colors.white12, size: 60)),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xCC000000)],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12, left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: _gold, borderRadius: BorderRadius.circular(6)),
                child: const Text('Featured Event', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ),
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Pitch Night: Innovation in Kigali', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_rounded, color: Colors.white54, size: 13),
                        const SizedBox(width: 4),
                        const Text('Oct 24, 2023', style: TextStyle(color: Colors.white54, fontSize: 12)),
                        const SizedBox(width: 12),
                        const Icon(Icons.location_on_rounded, color: Colors.white54, size: 13),
                        const SizedBox(width: 4),
                        const Text('The Leadership Lab', style: TextStyle(color: Colors.white54, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _gold,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {},
                        child: const Text('View details', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
          Text(action, style: const TextStyle(color: _gold, fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildOpportunityTile({
    required IconData icon,
    required String tag,
    required Color tagColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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
            decoration: BoxDecoration(color: tagColor.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: tagColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(color: tagColor.withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
                  child: Text(tag, style: TextStyle(color: tagColor, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                ),
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Colors.white24, size: 20),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF21262D)),
        ),
        child: Icon(icon, color: Colors.white70, size: 20),
      ),
    );
  }
}