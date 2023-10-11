import 'package:apptest/controllers/tacheController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TacheView extends StatelessWidget {
  TacheView({Key? key}) : super(key: key);
  final TacheController tacheController = Get.put(TacheController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Taches"),
        actions: const <Widget>[],
      ),
      body: getBody(),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            // Get.put(PdvController()).onReinit();
            Get.toNamed("/addtache");
          },
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget getBody() {
    tacheController.getTache();
    return Column(
      children: [
        //Text('test'),Text(e.code_pdv.toString())
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx, index) {
              return Obx(
                () => tacheController.isLoading.value
                    ? const Text("Loading")
                    //Lottie.asset(name)
                    : Column(
                        children: tacheController.tache
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              e.titre.toString(),
                                              style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            //onLongPress: {},
                                            leading: const Icon(Icons.task),
                                          ),
                                          ButtonBar(
                                            children: [
                                              MaterialButton(
                                                  child: const Text(
                                                    "Supprimer",
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    await tacheController
                                                        .deleteTache(e.id!);
                                                  }),
                                              MaterialButton(
                                                  child: const Text(
                                                    "Modifier",
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    // await tacheController
                                                    //     .updatePdvapi(e.id!);
                                                  }),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
              );
            }, //pdvs?.length ?? 0,
          ),
        ),

        //  GetBuilder<PdvController>(
        //   builder: (value) => Expanded(
        //     child: FutureBuilder<Pdv>(
        //       builder: (ctx, AsyncSnapshot snapshot) {
        //         return ListView.builder(
        //           itemCount: pdvapicntr.nb,
        //           itemBuilder: (ctx, index) {
        //             return Obx(() => Column(
        //                   children: pdvapicntr.pdvapi
        //                       .map((e) => Padding(
        //                             padding: const EdgeInsets.all(8.0),
        //                             child: Text(e.code_pdv.toString()),
        //                           ))
        //                       .toList(),
        //                 ));
        //           }, //pdvs?.length ?? 0,
        //         );
        //       },
        //       future: value.getPdvs,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
