import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const _bg = Color(0xFF0D1117);
  static const _gold = Color(0xFFF5A623);
  static const _border = Color(0xFF21262D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                  ),
                  border: Border.all(color: _border),
                ),
                child: const Center(
                  child: Icon(Icons.groups_rounded, color: Colors.white24, size: 96),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Welcome to ALU Connect',
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                'Discover events, build communities, and keep up with everything happening across campus.',
                style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 15, height: 1.5),
              ),
              const Spacer(),
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
                  child: const Text('Get started', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: _border),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {},
                  child: const Text('I already have an account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}