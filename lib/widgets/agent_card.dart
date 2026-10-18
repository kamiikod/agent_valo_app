import 'package:flutter/material.dart';
import 'package:agent_valo_app/model/agent.dart';
import 'package:agent_valo_app/pages/detail_page.dart';
import 'package:agent_valo_app/widgets/type_chip.dart';

/// Versi grid dari AgentList (dipakai kalau layar lebih lebar dari 425).
class AgentCard extends StatelessWidget {
  final Agent agent;
  const AgentCard({super.key, required this.agent});

  static const _red = Color(0xFFFF4655);

  // Kalau gambar agent lu punya background sendiri (bukan transparan)
  // dan kelihatan aneh, ganti jadi BoxFit.cover.
  static const _imageFit = BoxFit.contain;

  static final _bg = ResizeImage(
    const AssetImage('assets/images/agent_bg.png'),
    width: 700,
  );

  void _openDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(agent: agent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(22);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: _red.withValues(alpha: 0.22),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: _red, // fallback kalau gambar belum kebaca
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _bg,
              fit: BoxFit.cover,
              onError: (_, __) {},
            ),
          ),
          child: InkWell(
            onTap: () => _openDetail(context),
            splashColor: Colors.white.withValues(alpha: 0.12),
            highlightColor: Colors.white.withValues(alpha: 0.06),
            child: Column(
              children: [
                // Area gambar agent
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Hero(
                          tag: agent.name,
                          child: Image.asset(
                            agent.image,
                            fit: _imageFit,
                            alignment: Alignment.bottomCenter,
                            errorBuilder: (_, __, ___) => const Center(
                              child: Icon(
                                Icons.person,
                                size: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withValues(alpha: 0.22),
                          ),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 18,
                            color: Colors.white.withValues(alpha: 0.95),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Strip info di bawah, lebih gelap supaya teks kebaca
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                  color: Colors.black.withValues(alpha: 0.30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        agent.name.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TypeChip(type: agent.role, onColor: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
