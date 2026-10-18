import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  final String type;

  /// true = dipakai di atas background berwarna (teks & ikon putih).
  final bool onColor;

  const TypeChip({super.key, required this.type, this.onColor = false});

  // Warna role dibuat kalem. Asset dipakai kalau ada, kalau belum ada
  // otomatis jatuh ke ikon bawaan.
  static const _roles = <String, _Role>{
    'duelist': _Role(
      Color(0xFFC0706F),
      Icons.bolt_rounded,
      'assets/roles/duelist.png',
    ),
    'controller': _Role(
      Color(0xFF9283B8),
      Icons.cloud_rounded,
      'assets/roles/controller.png',
    ),
    'sentinel': _Role(
      Color(0xFF6BA89C),
      Icons.shield_rounded,
      'assets/roles/sentinel.png',
    ),
    'initiator': _Role(
      Color(0xFFC7A06A),
      Icons.radar_rounded,
      'assets/roles/initiator.png',
    ),
  };

  _Role _role() {
    final t = type.toLowerCase();
    for (final e in _roles.entries) {
      if (t.contains(e.key)) return e.value;
    }
    return const _Role(Color(0xFF8A8F98), Icons.help_outline_rounded, null);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final role = _role();

    final bg = onColor
        ? Colors.black.withValues(alpha: 0.22)
        : cs.onSurface.withValues(alpha: 0.05);
    final border = onColor
        ? Colors.white.withValues(alpha: 0.28)
        : cs.outline.withValues(alpha: 0.25);
    final iconColor = onColor ? Colors.white : role.color;
    final textColor = onColor
        ? Colors.white
        : cs.onSurface.withValues(alpha: 0.85);

    Widget fallback() => Icon(role.icon, size: 15, color: iconColor);

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 12, 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: role.asset == null
                ? fallback()
                : Image.asset(
                    role.asset!,
                    fit: BoxFit.contain,
                    color: iconColor,
                    colorBlendMode: BlendMode.srcIn,
                    errorBuilder: (_, __, ___) => fallback(),
                  ),
          ),
          const SizedBox(width: 6),
          Text(
            type,
            style: TextStyle(
              color: textColor,
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _Role {
  final Color color;
  final IconData icon;
  final String? asset;
  const _Role(this.color, this.icon, this.asset);
}
