import 'package:flutter/material.dart';
import 'package:agent_valo_app/model/agent.dart';

class DetailPage extends StatelessWidget {
  final Agent agent;
  const DetailPage({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(agent.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Image.asset(
                  agent.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    agent.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        width: 1,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(agent.role),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Deskripsi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 8),
                  Text(
                    agent.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Skills",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  
                  SizedBox(height: 8,),
                  Wrap(
                    children: agent.abilities.map((e) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star,),
                          SizedBox(width: 8,),
                          Text(e),
                        ]
                      ),
                    )).toList(),
                  ),
                  SizedBox(height: 8,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
