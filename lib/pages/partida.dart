import 'package:flutter/material.dart';

class PartidaPage extends StatefulWidget {
  const PartidaPage({super.key});

  @override
  State<PartidaPage> createState() => _PartidaPageState();
}

class _PartidaPageState extends State<PartidaPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['1', '2', '3'];
    final _formKey = GlobalKey<FormState>();

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
              padding: EdgeInsets.all(10.0),
              height: 300,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(130, 177, 255, 1)),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Alana",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                          ),
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
                      const Text(
                        "X",
                        style: TextStyle(fontSize: 30),
                      ),
                      Column(
                        children: [
                          const Text(
                            "Alana",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                          ),
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
                  SizedBox(height: 20),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Round ${entries[index]}",
                                style:
                                    const TextStyle(fontWeight: FontWeight.w900),
                              ),
                              Container(
                                  height: 20,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)),
                                  child: const Center(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '0',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  )),
                              Text("X"),
                              Container(
                                  height: 20,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey)),
                                  child: const Center(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '0',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  )),
                            ],
                          ),
                        );
                      }),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Ação do botão
                    },
                    child: const Text(
                      'Salvar',
                    ),
                  ),
                ]),
              ),
            )),
      ),
    );
  }
}
