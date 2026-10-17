import 'package:flutter/material.dart';
// import 'package:flutter_apps/models/pokemon.dart';
// import 'package:flutter_apps/pages/detail_page.dart';

import 'package:agent_valo_app/model/agent.dart';
import 'package:agent_valo_app/pages/detail_page.dart';

class AgentCard extends StatelessWidget {
  final Agent agent;
  const AgentCard({super.key, required this.agent});

  void _detailPage(BuildContext context, Agent agent){
    Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(agent: agent)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _detailPage(context, agent);
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        clipBehavior: Clip.antiAlias,
        child: Hero(
          tag: agent.name,
          child: Image.asset(
            agent.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
