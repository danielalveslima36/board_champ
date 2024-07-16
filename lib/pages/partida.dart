import 'package:flutter/material.dart';

class Partida extends StatelessWidget {
  const Partida({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['1', '2', '3'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Partida"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                height: 300,
                decoration: const BoxDecoration(color: Color.fromRGBO(130, 177, 255, 1)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text("Alana"),
                            Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey)),
                              child: const Center(
                                  child: Text(
                                "57",
                                style: TextStyle(fontSize: 20),
                              )),
                            ),
                          ],
                        ),
                        const Text("X"),
                        Column(
                          children: [
                            const Text("Paulo"),
                            Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey)),
                              child: const Center(
                                  child: Text(
                                "45",
                                style: TextStyle(fontSize: 20),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Table(
                      children: [
                        TableRow(
                          children: [
                            ListView.builder(
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
                                          "Round ${entries[index]}",
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
                        )
                      ],
                    )
                  ],
                )
                ]
              ),
          )
          ),
      )
    );
  }
}
