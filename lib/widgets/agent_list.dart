import 'package:flutter/material.dart';
import 'package:agent_valo_app/model/agent.dart';
import 'package:agent_valo_app/pages/detail_page.dart';
import 'package:agent_valo_app/widgets/type_chip.dart';

class AgentList extends StatelessWidget {
  final Agent agent;
  const AgentList({super.key, required this.agent});

  static const _red = Color(0xFFFF4655);
  static final _bg = ResizeImage(
    const AssetImage('assets/images/agent_bg.png'),
    width: 900,
  );

  void _openDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(agent: agent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(20);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: DecoratedBox(
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
              child: Container(
                padding: const EdgeInsets.fromLTRB(14, 14, 16, 14),
                // Overlay tipis supaya teks di kiri tetap kontras
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0x40000000), Color(0x00000000)],
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withValues(alpha: 0.18),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.85),
                          width: 1.5,
                        ),
                      ),
                      child: Hero(
                        tag: agent.name,
                        child: ClipOval(
                          child: Image.asset(
                            agent.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const SizedBox(
                              width: 60,
                              height: 60,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
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
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TypeChip(type: agent.role, onColor: true),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
