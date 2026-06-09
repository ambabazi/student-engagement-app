import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

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
        title: const Text('Chats'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final chats = [
            ('Martha', 'Can you share the event deck?', '2m'),
            ('Design Club', 'New workshop starts tomorrow.', '18m'),
            ('Samuel', 'I posted the community update.', '1h'),
            ('Founders Hub', 'Pitch night registration is open.', '3h'),
          ];
          final chat = chats[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: _border),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: _gold.withOpacity(0.15),
                  child: const Icon(Icons.person_rounded, color: _gold),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(chat.$1, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
                          Text(chat.$3, style: TextStyle(color: Colors.white.withOpacity(0.45), fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(chat.$2, style: TextStyle(color: Colors.white.withOpacity(0.72))),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}