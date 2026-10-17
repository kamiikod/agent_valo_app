import 'package:flutter/material.dart';
import 'package:agent_valo_app/model/agent.dart';
import 'package:agent_valo_app/widgets/type_chip.dart';

class DetailPage extends StatelessWidget {
  final Agent agent;
  const DetailPage({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(agent.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: agent.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  agent.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) => const SizedBox(
                    height: 200,
                    child: Center(child: Icon(Icons.broken_image, size: 48)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agent.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TypeChip(type: agent.role),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Text(agent.description, textAlign: TextAlign.justify),
                  const SizedBox(height: 16),
                  const Text(
                    'Skills',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  ...agent.abilities.map((e) {
                    final parts = e.split(' - ');
                    final title = parts.first;
                    final desc = parts.length > 1
                        ? parts.sublist(1).join(' - ')
                        : '';
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.star),
                      title: Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: desc.isEmpty ? null : Text(desc),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
