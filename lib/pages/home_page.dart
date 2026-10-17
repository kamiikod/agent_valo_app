import 'package:flutter/material.dart';
import 'package:agent_valo_app/data/agent_data.dart';
import 'package:agent_valo_app/model/agent.dart';
import 'package:agent_valo_app/widgets/agent_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Agent> agents = dataAgents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent Valorant'),
        centerTitle: true,
        actions: const [Icon(Icons.favorite), SizedBox(width: 10)],
      ),
      body: ListView.builder(
        itemCount: agents.length,
        itemBuilder: (context, index) => AgentList(agent: agents[index]),
      ),
    );
  }
}
