import 'dart:convert';

import 'package:apptest/models/tache.dart';
import 'package:apptest/services/api/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TacheController extends GetxController {
  var tache = RxList<Tache>();
  RxBool isLoading = false.obs;
  int? nb;
  final TextEditingController titreController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<RxList<Tache>> getTache() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse(Api().getUri));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        tache.add(Tache.fromJson(index));
      }
      isLoading.value = false;
      nb = tache.length;
      return tache;
    } else {
      nb = tache.length;
      return tache;
    }
  }

  Future<void> addTache() async {
    final Map<String, dynamic> data = {
      "titre": titreController.text,
      "description": descriptionController.text,
    };

    isLoading.value = true;
    final response = await http.post(
      Uri.parse(Api().saveUri),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: json.encode(data),
    );
    if (response.statusCode == 201) {
      tache.clear();
      getTache();
      isLoading.value = false;
    } else {}
  }

  Future<void> deleteTache(int id) async {
    isLoading.value = true;
    final response = await http.delete(
      Uri.parse("http://192.168.43.104:8001/api/taches/$id"),
    );

    if (response.statusCode == 200) {
      tache.clear();
      getTache();
      isLoading.value = false;
    } else {}
  }
}
