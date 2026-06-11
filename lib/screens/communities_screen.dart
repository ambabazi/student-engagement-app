import 'package:flutter/material.dart';

// ─── Data Models ──────────────────────────────────────────────────────────────

class Community {
  final String id;
  final String name;
  final String description;
  final int memberCount;
  final List<String> tags;
  final IconData icon;
  final bool isJoined;

  const Community({
    required this.id,
    required this.name,
    required this.description,
    required this.memberCount,
    required this.tags,
    required this.icon,
    this.isJoined = false,
  });
}

// ─── Mock Data ────────────────────────────────────────────────────────────────

final List<Community> _allCommunities = [
  Community(
    id: '1',
    name: 'ALU Debate Society',
    description: 'Sharpen your arguments and lead the conversation.',
    memberCount: 148,
    tags: ['LEADERSHIP', 'PUBLIC SPEAKING'],
    icon: Icons.record_voice_over_outlined,
    isJoined: false,
  ),
  Community(
    id: '2',
    name: 'Entrepreneurship Club',
    description: 'Build ventures, find co-founders, and pitch your ideas.',
    memberCount: 312,
    tags: ['BUSINESS', 'INNOVATION'],
    icon: Icons.lightbulb_outline,
    isJoined: true,
  ),
  Community(
    id: '3',
    name: 'Tech & Coding Hub',
    description: 'Collaborate on projects, hackathons, and open source.',
    memberCount: 276,
    tags: ['SOFTWARE', 'DESIGN'],
    icon: Icons.code_outlined,
    isJoined: false,
  ),
  Community(
    id: '4',
    name: 'ALU Writers Guild',
    description: 'Fiction, essays, poetry — create and share your words.',
    memberCount: 89,
    tags: ['CREATIVE', 'ARTS'],
    icon: Icons.edit_outlined,
    isJoined: false,
  ),
  Community(
    id: '5',
    name: 'Health & Wellness',
    description: 'Mental health, fitness, and living well at ALU.',
    memberCount: 203,
    tags: ['LIFESTYLE', 'WELLBEING'],
    icon: Icons.favorite_outline,
    isJoined: true,
  ),
  Community(
    id: '6',
    name: 'Data Science & AI',
    description: 'Explore machine learning, analytics, and AI research.',
    memberCount: 194,
    tags: ['TECHNOLOGY', 'RESEARCH'],
    icon: Icons.bar_chart_outlined,
    isJoined: false,
  ),
];

final List<Community> _myJoinedCommunities =
    _allCommunities.where((c) => c.isJoined).toList();

// ─── Main Screen ──────────────────────────────────────────────────────────────

class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Local join state
  final Map<String, bool> _joinState = {
    for (var c in _allCommunities) c.id: c.isJoined,
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text.trim().toLowerCase());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<Community> get _filteredAll {
    if (_searchQuery.isEmpty) return _allCommunities;
    return _allCommunities.where((c) {
      return c.name.toLowerCase().contains(_searchQuery) ||
          c.tags.any((t) => t.toLowerCase().contains(_searchQuery));
    }).toList();
  }

  List<Community> get _filteredMine {
    final joined =
        _allCommunities.where((c) => _joinState[c.id] == true).toList();
    if (_searchQuery.isEmpty) return joined;
    return joined.where((c) {
      return c.name.toLowerCase().contains(_searchQuery) ||
          c.tags.any((t) => t.toLowerCase().contains(_searchQuery));
    }).toList();
  }

  void _toggleJoin(String id) {
    setState(() => _joinState[id] = !(_joinState[id] ?? false));
    final c = _allCommunities.firstWhere((c) => c.id == id);
    final joined = _joinState[id] ?? false;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          joined ? 'Joined ${c.name}!' : 'Left ${c.name}.',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: joined ? const Color(0xFFF5A623) : Colors.grey[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _CommunityList(
                  communities: _filteredAll,
                  joinState: _joinState,
                  onToggleJoin: _toggleJoin,
                  emptyMessage: 'No communities match your search.',
                ),
                _CommunityList(
                  communities: _filteredMine,
                  joinState: _joinState,
                  onToggleJoin: _toggleJoin,
                  emptyMessage: 'You haven\'t joined any communities yet.',
                  isMineTab: true,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFAB(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0D0D1A),
      elevation: 0,
      title: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFFF5A623),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.hub_outlined, size: 16, color: Colors.black),
          ),
          const SizedBox(width: 8),
          const Text(
            'ALU Connect',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Communities',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Find your tribe and grow with fellow students.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Find clubs, communities...',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 14),
            prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.35), size: 18),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: const Color(0xFFF5A623),
          borderRadius: BorderRadius.circular(8),
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white.withOpacity(0.5),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(text: 'All Clubs'),
          Tab(text: 'My Clubs'),
        ],
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => _showCreateCommunitySheet(),
      backgroundColor: const Color(0xFFF5A623),
      child: const Icon(Icons.add, color: Colors.black),
    );
  }

  void _showCreateCommunitySheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Start a Community',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Create a space for students with shared interests.',
              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5A623),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Get Started',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0D0D1A),
      selectedItemColor: const Color(0xFFF5A623),
      unselectedItemColor: Colors.white.withOpacity(0.4),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: 2,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: 'Communities'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
      onTap: (_) {}, // navigation handled by main.dart router
    );
  }
}

// ─── Community List ───────────────────────────────────────────────────────────

class _CommunityList extends StatelessWidget {
  final List<Community> communities;
  final Map<String, bool> joinState;
  final void Function(String id) onToggleJoin;
  final String emptyMessage;
  final bool isMineTab;

  const _CommunityList({
    required this.communities,
    required this.joinState,
    required this.onToggleJoin,
    required this.emptyMessage,
    this.isMineTab = false,
  });

  @override
  Widget build(BuildContext context) {
    if (communities.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.group_off_outlined,
                size: 48, color: Colors.white.withOpacity(0.2)),
            const SizedBox(height: 12),
            Text(
              emptyMessage,
              style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
      itemCount: communities.length,
      itemBuilder: (context, index) {
        final c = communities[index];
        final joined = joinState[c.id] ?? false;
        return _CommunityCard(
          community: c,
          isJoined: joined,
          onToggle: () => onToggleJoin(c.id),
        );
      },
    );
  }
}

// ─── Community Card ───────────────────────────────────────────────────────────

class _CommunityCard extends StatelessWidget {
  final Community community;
  final bool isJoined;
  final VoidCallback onToggle;

  const _CommunityCard({
    required this.community,
    required this.isJoined,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isJoined
              ? const Color(0xFFF5A623).withOpacity(0.35)
              : Colors.white.withOpacity(0.06),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5A623).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(community.icon,
                    color: const Color(0xFFF5A623), size: 22),
              ),
              const SizedBox(width: 12),
              // Name + member count
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      community.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${community.memberCount} Members',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.45),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Join / Joined button
              GestureDetector(
                onTap: onToggle,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                  decoration: BoxDecoration(
                    color: isJoined
                        ? Colors.transparent
                        : const Color(0xFFF5A623),
                    borderRadius: BorderRadius.circular(20),
                    border: isJoined
                        ? Border.all(
                            color: const Color(0xFFF5A623).withOpacity(0.6))
                        : null,
                  ),
                  child: Text(
                    isJoined ? 'Joined' : 'Join',
                    style: TextStyle(
                      color: isJoined
                          ? const Color(0xFFF5A623)
                          : Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Description
          Text(
            community.description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          // Tags
          Wrap(
            spacing: 6,
            children: community.tags.map((tag) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}