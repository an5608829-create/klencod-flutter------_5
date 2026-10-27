import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProjectTypeScreen extends StatelessWidget {
  const ProjectTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: SafeArea(
        child: Column(
          children: [
            // Status bar space already handled by SafeArea
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    const Text(
                      'نوع المشروع',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subtitle
                    Text(
                      'اختر نوع المشروع الذي تريد إنشاءه:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Flutter Card
                    _ProjectCard(
                      title: 'Flutter',
                      subtitle: 'تطبيق Flutter متعدد المنصات\n(Dart)',
                      icon: _FlutterIcon(),
                      tags: const [
                        _Tag(text: 'GitHub Actions', color: Color(0xFF1F6FEB)),
                        _Tag(text: '.dart', color: Color(0xFF30363D)),
                        _Tag(text: 'Dart', color: Color(0xFF1F6FEB)),
                      ],
                      onTap: () {
                        // هنا تحط الـ navigation لما يختار Flutter
                      },
                    ),
                    const SizedBox(height: 14),

                    // Android (Java) Card
                    _ProjectCard(
                      title: 'Android (Java)',
                      subtitle: 'تطبيق Android أصلي بلغة\nJava',
                      icon: _JavaIcon(),
                      tags: const [
                        _Tag(text: 'GitHub Actions', color: Color(0xFF1F6FEB)),
                        _Tag(text: '.java', color: Color(0xFF30363D)),
                        _Tag(text: 'Java', color: Color(0xFF9E6A03)),
                      ],
                      onTap: () {},
                    ),
                    const SizedBox(height: 14),

                    // Android (Kotlin) Card
                    _ProjectCard(
                      title: 'Android (Kotlin)',
                      subtitle: 'تطبيق Android أصلي بلغة\nKotlin',
                      icon: _KotlinIcon(),
                      tags: const [
                        _Tag(text: 'GitHub Actions', color: Color(0xFF1F6FEB)),
                        _Tag(text: '.kt', color: Color(0xFF30363D)),
                        _Tag(text: 'Kotlin', color: Color(0xFF7B61FF)),
                      ],
                      onTap: () {},
                    ),
                    const SizedBox(height: 14),

                    // React Native Card
                    _ProjectCard(
                      title: 'React Native',
                      subtitle: 'تطبيق React Native CLI\n(TypeScript + Native)',
                      icon: _ReactIcon(),
                      tags: const [],
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            // Cancel Button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'إلغاء',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== Project Card ====================
class _ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final List<_Tag> tags;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tags,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          decoration: BoxDecoration(
            color: const Color(0xFF161B22),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF30363D),
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left arrow
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 4),
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white.withOpacity(0.45),
                  size: 22,
                ),
              ),
              const SizedBox(width: 4),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.65),
                        fontSize: 13.5,
                        height: 1.35,
                      ),
                    ),
                    if (tags.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: tags
                            .map((t) => _TagChip(tag: t))
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Icon
              icon,
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== Tag ====================
class _Tag {
  final String text;
  final Color color;

  const _Tag({required this.text, required this.color});
}

class _TagChip extends StatelessWidget {
  final _Tag tag;

  const _TagChip({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: tag.color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: tag.color.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Text(
        tag.text,
        style: TextStyle(
          color: tag.color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ==================== Icons ====================
class _FlutterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Image.network(
          'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg',
          width: 32,
          height: 32,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.flutter_dash,
            color: Color(0xFF54C5F8),
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _JavaIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          '☕',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}

class _KotlinIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: const LinearGradient(
              colors: [Color(0xFF7F52FF), Color(0xFFC711E1), Color(0xFFF88909)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Text(
              'K',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ReactIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          '⚛️',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}