import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agent_valo_app/data/agent_data.dart';
import 'package:agent_valo_app/model/agent.dart';
import 'package:agent_valo_app/widgets/agent_card.dart';
import 'package:agent_valo_app/widgets/agent_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Agent> agents = dataAgents;

  static const _red = Color(0xFFFF4655);
  static const _bg = Color(0xFF0F1923);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _bg,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'AGENT VALORANT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              '${agents.length} AGENTS',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 11,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.6,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _red.withValues(alpha: 0.12),
                border: Border.all(color: _red.withValues(alpha: 0.35)),
              ),
              child: IconButton(
                onPressed: () {},
                tooltip: 'Favorit',
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.favorite_rounded, color: _red, size: 20),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _red.withValues(alpha: 0),
                  _red.withValues(alpha: 0.7),
                  _red.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          // HP: tampilan list
          if (width <= 425) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemCount: agents.length,
              itemBuilder: (context, index) => AgentList(agent: agents[index]),
            );
          }

          // Layar lebih lebar: tampilan grid.
          // Jumlah kolom nambah seiring lebar layar.
          final crossAxisCount = width <= 700 ? 2 : (width <= 1000 ? 3 : 4);

          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.82,
            ),
            itemCount: agents.length,
            itemBuilder: (context, index) => AgentCard(agent: agents[index]),
          );
        },
      ),
    );
  }
}
