import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  final String type;
  const TypeChip({super.key, required this.type});

  Color _roleColor() {
    if (type.contains('Duelist')) return Colors.blue;
    if (type.contains('Controller')) return Colors.purple;
    if (type.contains('Sentinel')) return Colors.green;
    if (type.contains('Initiator')) return Colors.orange;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final color = _roleColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(type),
    );
  }
}
