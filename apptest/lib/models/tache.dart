class Tache {
  int? id;
  String? titre;
  String? description;

  Tache({
    this.id,
    this.titre,
    this.description,
  });

  Tache.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    titre = json["titre"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["titre"] = titre;
    data["description"] = description;

    return data;
  }
}
