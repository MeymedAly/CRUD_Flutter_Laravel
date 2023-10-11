import 'package:apptest/controllers/tacheController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tache extends StatelessWidget {
  Tache({Key? key}) : super(key: key);

  final _formPdvKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Tache",
          textAlign: TextAlign.center,
        )),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    TacheController tacheController = Get.put(TacheController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: Form(
          key: _formPdvKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                GetBuilder<TacheController>(
                    builder: (val) => TextFormField(
                          controller: val.titreController,
                          decoration: const InputDecoration(
                              hintText: "Titre", icon: Icon(Icons.title)),
                        )),
                const Padding(padding: EdgeInsets.all(10.0)),
                GetBuilder<TacheController>(
                    builder: (val) => TextFormField(
                          controller: val.descriptionController,
                          decoration: const InputDecoration(
                              hintText: "Description", icon: Icon(Icons.title)),
                        )),
                const Padding(padding: EdgeInsets.all(10.0)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GetBuilder<TacheController>(
                          builder: (ctrl) => MaterialButton(
                              color: Colors.blueAccent,
                              onPressed: () {
                                tacheController.addTache().then((value) {
                                  Get.toNamed("/");
                                });
                              },
                              child: const Text("Ok"))),
                    ])
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
