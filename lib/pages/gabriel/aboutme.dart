import 'package:flutter/material.dart';

/// Gabriel Kominas — personal landing page.
///
class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _pageTheme(context),
      child: const _LandingScaffold(),
    );
  }
}

// ---------------------------------------------------------------------------
// CONTENT — edit this section, leave the rest alone.
// ---------------------------------------------------------------------------

class _Content {
  static const String name = 'Gabriel Kominas';
  static const String role = 'Computer Science Student · Aspiring Cybersecurity Specialist';
  static const String location = 'Baton Rouge, Louisiana, United States';

  static const String intro =
      'I enjoy strengthening my skills in programming and learning new '
      'technologies. I like turning rough ideas into working software and '
      'figuring out how things fit together under the hood.';

  static const List<String> skills = [
    'Dart / Flutter',
    'Java',
    'Python',
    'C',
    'Git & GitHub',
    'SQL',
    'Data Structures',
    'Problem Solving',
  ];

  static const List<_Project> projects = [
    _Project(
      title: 'About Me App',
      description:
          'A multi-page Flutter app built with a teammate to practice '
          'navigation, theming, and clean widget composition.',
      tag: 'Flutter',
    ),
    _Project(
      title: 'Decision Roulette App',
      description:
          'A Flutter app that randomly selects an option from a list of user-provided choices.'
          'I built this to practice state management and animations, and I learned a lot about Flutter while building it.',
      tag: 'Coursework',
    ),
    _Project(
      title: 'Flexforge',
      description:
          'A fitness traking website designed to help users track their workouts and progress over time. '
          'I built this in line with previous coursework along with a small group of classmates. I learned a lot about web development, teamwork and git basics while developing it.',
      tag: 'Coursework',
    ),
  ];

  static const List<_Link> links = [
    _Link('GitHub', Icons.code, 'github.com/gkominas'),
    _Link('Email', Icons.mail_outline, 'gabekominas@gmail.com'),
    _Link('LinkedIn', Icons.work_outline, 'linkedin.com/in/gkominas'),
  ];
}

class _Project {
  final String title;
  final String description;
  final String tag;
  const _Project({required this.title, required this.description, required this.tag});
}

class _Link {
  final String label;
  final IconData icon;
  final String value;
  const _Link(this.label, this.icon, this.value);
}

// ---------------------------------------------------------------------------
// THEME
// ---------------------------------------------------------------------------

ThemeData _pageTheme(BuildContext context) {
  final base = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6C5CE7),
    brightness: Brightness.dark,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: base,
    scaffoldBackgroundColor: const Color(0xFF0E0D14),
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: const Color(0xFFE7E5F0),
          displayColor: Colors.white,
        ),
  );
}

// ---------------------------------------------------------------------------
// LAYOUT
// ---------------------------------------------------------------------------

class _LandingScaffold extends StatelessWidget {
  const _LandingScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: _Hero()),
          SliverToBoxAdapter(
            child: _CenteredColumn(
              children: [
                const SizedBox(height: 8),
                _Section(
                  title: 'About',
                  child: Text(
                    _Content.intro,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          color: const Color(0xFFBFBCD0),
                        ),
                  ),
                ),
                _Section(
                  title: 'Skills',
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final s in _Content.skills) _SkillChip(label: s),
                    ],
                  ),
                ),
                _Section(
                  title: 'Projects',
                  child: Column(
                    children: [
                      for (final p in _Content.projects)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _ProjectCard(project: p),
                        ),
                    ],
                  ),
                ),
                _Section(
                  title: 'Get in touch',
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      for (final l in _Content.links) _LinkButton(link: l),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                Text(
                  '© ${DateTime.now().year} ${_Content.name}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6E6B84),
                      ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Keeps content in a comfortable reading column on wide screens.
class _CenteredColumn extends StatelessWidget {
  final List<Widget> children;
  const _CenteredColumn({required this.children});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 96, 24, 56),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1B1636), Color(0xFF0E0D14)],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            children: [
              Container(
                width: 108,
                height: 108,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [scheme.primary, scheme.tertiary],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: scheme.primary.withOpacity(0.4),
                      blurRadius: 40,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  _initials(_Content.name),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _Content.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                _Content.role,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: scheme.primary.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.place_outlined, size: 16, color: Color(0xFF8B88A0)),
                  const SizedBox(width: 4),
                  Text(
                    _Content.location,
                    style: const TextStyle(color: Color(0xFF8B88A0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13.5, color: Color(0xFFD9D7E6)),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final _Project project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: scheme.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  project.tag,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: scheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            project.description,
            style: const TextStyle(
              height: 1.5,
              color: Color(0xFFAFACC2),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final _Link link;
  const _LinkButton({required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        // Hook up url_launcher here if you want these to open.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${link.label}: ${link.value}')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(link.icon, size: 18, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              link.label,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
            ),
          ],
        ),
      ),
    );
  }
}

String _initials(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));
  if (parts.length == 1) return parts.first.characters.first.toUpperCase();
  return (parts.first.characters.first + parts.last.characters.first).toUpperCase();
}
