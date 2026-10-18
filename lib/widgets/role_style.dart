import 'package:flutter/material.dart';

class RoleStyle {
  final Color color;
  final IconData fallbackIcon;
  final String? assetPath;
  const RoleStyle(this.color, this.fallbackIcon, [this.assetPath]);
}

const _roles = <String, RoleStyle>{
  'duelist': RoleStyle(
    Color(0xFFC0706F),
    Icons.bolt_rounded,
    'assets/roles/duelist.png',
  ),
  'controller': RoleStyle(
    Color(0xFF9283B8),
    Icons.cloud_rounded,
    'assets/roles/controller.png',
  ),
  'sentinel': RoleStyle(
    Color(0xFF6BA89C),
    Icons.shield_rounded,
    'assets/roles/sentinel.png',
  ),
  'initiator': RoleStyle(
    Color(0xFFC7A06A),
    Icons.radar_rounded,
    'assets/roles/initiator.png',
  ),
};

const _unknown = RoleStyle(Color(0xFF8A8F98), Icons.help_outline_rounded);

RoleStyle roleStyleOf(String type) {
  final t = type.toLowerCase();
  for (final e in _roles.entries) {
    if (t.contains(e.key)) return e.value;
  }
  return _unknown;
}

/// Gambar role dengan ukuran konsisten. Kalau asset ga ada, pakai ikon.
class RoleIcon extends StatelessWidget {
  final String type;
  final double size;
  final Color? color;

  /// true = gambar diwarnai (cocok buat ikon putih/monokrom seperti di game).
  /// false = pakai warna asli gambar.
  final bool tint;

  const RoleIcon({
    super.key,
    required this.type,
    this.size = 16,
    this.color,
    this.tint = true,
  });

  @override
  Widget build(BuildContext context) {
    final style = roleStyleOf(type);
    final tintColor = color ?? style.color;

    Widget fallback() =>
        Icon(style.fallbackIcon, size: size * 0.9, color: tintColor);

    return SizedBox(
      width: size,
      height: size,
      child: style.assetPath == null
          ? fallback()
          : Image.asset(
              style.assetPath!,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.medium,
              color: tint ? tintColor : null,
              colorBlendMode: tint ? BlendMode.srcIn : null,
              errorBuilder: (_, __, ___) => fallback(),
            ),
    );
  }
}
