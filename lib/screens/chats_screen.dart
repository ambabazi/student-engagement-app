import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06162D),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF5C26B),
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF08192F),
        shape: const CircularNotchedRectangle(),

        child: SizedBox(
          height: 70,

          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,

            children: [
              navItem(
                Icons.home_outlined,
                "Home",
                Colors.grey,
              ),

              navItem(
                Icons.explore_outlined,
                "Explore",
                Colors.grey,
              ),

              const SizedBox(width: 40),

              navItem(
                Icons.chat_bubble_outline,
                "Chat",
                const Color(0xFFF5C26B),
              ),

              navItem(
                Icons.person_outline,
                "Profile",
                Colors.grey,
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              /// HEADER
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage(
                          'https://i.pravatar.cc/150?img=12',
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        "ALU Connect",
                        style: TextStyle(
                          color: Color(0xFFF5A623),
                          fontSize: 18,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Color(0xFFF5A623),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// TITLE
              const Text(
                "Chats",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// SEARCH BAR
              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFF0B2345),

                  borderRadius:
                      BorderRadius.circular(14),
                ),

                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),

                    SizedBox(width: 10),

                    Text(
                      "Search chats...",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// CHAT LIST
              Expanded(
                child: ListView(
                  children: const [

                    ChatCard(
                      name:
                          "AI Workshop Group",
                      message:
                          "Sarah: Just uploaded the project source files...",
                      time: "10:45 AM",
                      unreadCount: 4,
                    ),

                    ChatCard(
                      name:
                          "Emmanuel Kwesi",
                      message:
                          "Let's meet at the hub later?",
                      time: "Yesterday",
                    ),

                    ChatCard(
                      name:
                          "Entrepreneurship Club",
                      message:
                          "You: The pitch deck is ready for review.",
                      time: "Sun",
                      unreadCount: 12,
                    ),

                    ChatCard(
                      name: "Nia Zuri",
                      message:
                          "Thanks for the resources!",
                      time: "2d ago",
                    ),

                    ChatCard(
                      name:
                          "Data Science 101",
                      message:
                          "Marcus: Check out the new Jupyter Notebook",
                      time: "Oct 12",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget navItem(
    IconData icon,
    String label,
    Color color,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class ChatCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  const ChatCard({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFF10233E),

        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Row(
        children: [

          Stack(
            clipBehavior: Clip.none,

            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage(
                  'https://i.pravatar.cc/150',
                ),
              ),

              if (unreadCount > 0)
                Positioned(
                  top: -5,
                  right: -5,

                  child: Container(
                    width: 22,
                    height: 22,

                    decoration:
                        const BoxDecoration(
                      color:
                          Color(0xFFF5C26B),
                      shape:
                          BoxShape.circle,
                    ),

                    child: Center(
                      child: Text(
                        unreadCount
                            .toString(),

                        style:
                            const TextStyle(
                          color:
                              Colors.black,
                          fontSize: 10,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [
                    Expanded(
                      child: Text(
                        name,

                        style:
                            const TextStyle(
                          color:
                              Colors.white,
                          fontSize: 15,
                          fontWeight:
                              FontWeight.w600,
                        ),

                        overflow:
                            TextOverflow
                                .ellipsis,
                      ),
                    ),

                    Text(
                      time,

                      style:
                          const TextStyle(
                        color:
                            Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Text(
                  message,

                  style:
                      const TextStyle(
                    color:
                        Colors.grey,
                    fontSize: 13,
                  ),

                  overflow:
                      TextOverflow
                          .ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}