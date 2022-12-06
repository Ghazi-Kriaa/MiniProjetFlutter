import 'package:my_project_flutter/Data/models/categorie.dart';
import 'package:my_project_flutter/Data/web_services/categorie_service.dart';

class CategorieRepository {
  final CategorieService catserv;
  CategorieRepository(this.catserv);
  Future<List<Categorie>> getCategories() async {
    final categories = await catserv.getCategories();
    return categories.map((c) => Categorie.fromJson(c)).toList();
  }

  Future<Map> postCategorie(String nom, dynamic image) async {
    final categorie = await catserv.postCategorie(nom, image);
    return categorie;
  }
}
