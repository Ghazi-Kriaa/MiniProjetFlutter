class Categorie {
  late String? sId;
  late String? nomcategorie;
  late String? imagecategorie;
  Categorie({this.sId, this.nomcategorie, this.imagecategorie});
  Categorie.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nomcategorie = json['nomcategorie'];
    imagecategorie = json['imagecategorie'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['nomcategorie'] = nomcategorie;
    data['imagecategorie'] = imagecategorie;
    return data;
  }
}
