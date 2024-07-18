import 'package:flutter/material.dart';

class Ranking extends StatefulWidget {
  const Ranking({super.key});

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  final List<String> entries = <String>['Alana', 'Bruno', 'Carlos'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 70,
        color: Colors.blueAccent.shade100,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                entries[index],
                style: const TextStyle(fontSize: 20),
              ), 
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)
                ),
                child: const Center(
                  child: Text(
                    "57",
                    style: TextStyle(fontSize: 20),
                    )
                  ),
              )
            ],
          ),
        )
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  );
  }
}