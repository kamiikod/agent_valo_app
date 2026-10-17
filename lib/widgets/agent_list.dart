import 'package:flutter/material.dart';
import 'package:agent_valo_app/model/agent.dart';
import 'package:agent_valo_app/pages/detail_page.dart';
import 'package:agent_valo_app/widgets/type_chip.dart';

class AgentList extends StatelessWidget {
  final Agent agent;
  const AgentList({super.key, required this.agent});

  void _openDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(agent: agent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _openDetail(context),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: Hero(
          tag: agent.name,
          child: Image.asset(
            agent.image,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const SizedBox(
              width: 56,
              height: 56,
              child: Icon(Icons.person),
            ),
          ),
        ),
      ),
      title: Text(agent.name),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: TypeChip(type: agent.role),
      ),
      trailing: const Icon(Icons.favorite_border_outlined),
    );
  }
}