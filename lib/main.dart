import 'package:flutter/material.dart';

void main() {
  runApp(const ShortDemoApp());
}

class ShortDemoApp extends StatelessWidget {
  const ShortDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless vs Stateful',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6558F5),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F6FC),
      ),
      home: const WidgetComparisonPage(),
    );
  }
}

class WidgetComparisonPage extends StatelessWidget {
  const WidgetComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Widget Demo',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F6FC),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: const [
            _IntroHeader(),
            SizedBox(height: 20),
            StatelessDemoCard(),
            SizedBox(height: 16),
            StatefulDemoCard(),
            SizedBox(height: 20),
            _SummaryCard(),
            SizedBox(height: 20),
            _FooterLabel(),
          ],
        ),
      ),
    );
  }
}

class _IntroHeader extends StatelessWidget {
  const _IntroHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'STATELESS vs STATEFUL',
          style: TextStyle(
            color: Color(0xFF6558F5),
            fontSize: 13,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Pilih widget yang tepat',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF17182B),
              ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Contoh sederhana: teks sapaan dan counter interaktif.',
          style: TextStyle(
            color: Color(0xFF696B80),
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

/// StatelessWidget cocok untuk UI yang tidak mengelola state lokal yang berubah.
class StatelessDemoCard extends StatelessWidget {
  const StatelessDemoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DemoCard(
      label: '01  STATELESSWIDGET',
      accent: Color(0xFF2C75E8),
      icon: Icons.text_fields_rounded,
      title: 'Tampilan sederhana',
      subtitle: 'Tidak mengelola state lokal yang berubah.',
      child: GreetingWidget(),
    );
  }
}

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(Icons.waving_hand_rounded, color: Color(0xFF2C75E8), size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Hello, Flutter!',
              style: TextStyle(
                color: Color(0xFF193D78),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// StatefulWidget dipakai saat UI perlu mengelola state yang berubah.
class StatefulDemoCard extends StatelessWidget {
  const StatefulDemoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DemoCard(
      label: '02  STATEFULWIDGET',
      accent: Color(0xFF7654D8),
      icon: Icons.touch_app_rounded,
      title: 'Tampilan interaktif',
      subtitle: 'Nilai berubah saat tombol ditekan.',
      child: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1EDFF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          const Text(
            'Nilai counter saat ini',
            style: TextStyle(
              color: Color(0xFF65558E),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 180),
            child: Text(
              '$count',
              key: ValueKey<int>(count),
              style: const TextStyle(
                color: Color(0xFF4D35AD),
                fontSize: 42,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 8,
            children: [
              OutlinedButton.icon(
                onPressed: count == 0
                    ? null
                    : () {
                        setState(() {
                          count--;
                        });
                      },
                icon: const Icon(Icons.remove_rounded),
                label: const Text('Kurangi'),
              ),
              FilledButton.icon(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: const Icon(Icons.add_rounded),
                label: const Text('Tambah'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: count == 0
                ? null
                : () {
                    setState(() {
                      count = 0;
                    });
                  },
            child: const Text('Reset counter'),
          ),
        ],
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  const _DemoCard({
    required this.label,
    required this.accent,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String label;
  final Color accent;
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFFE7E8F1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(icon, color: accent),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: accent,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF202137),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF74758A),
                fontSize: 13,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF202137),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INGAT BEDANYA',
            style: TextStyle(
              color: Color(0xFFBDB6FF),
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 10),
          _SummaryRow(
            icon: Icons.check_circle_outline_rounded,
            text: 'StatelessWidget: UI tanpa state lokal yang berubah.',
          ),
          SizedBox(height: 8),
          _SummaryRow(
            icon: Icons.touch_app_rounded,
            text: 'StatefulWidget: UI mengelola state yang bisa berubah.',
          ),
          SizedBox(height: 8),
          _SummaryRow(
            icon: Icons.refresh_rounded,
            text: 'setState() memberi tahu Flutter untuk rebuild UI.',
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFFBDB6FF), size: 18),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterLabel extends StatelessWidget {
  const _FooterLabel();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text(
            'AA PROGRAMMING',
            style: TextStyle(
              color: Color(0xFF33344D),
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Real Code. Real Problems. Practical Solutions.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF818297), fontSize: 10),
          ),
        ],
      ),
    );
  }
}
