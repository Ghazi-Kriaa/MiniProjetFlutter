import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_project_flutter/Data/models/categorie.dart';
import 'package:my_project_flutter/Data/repository/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategorieRepository categorieRepository;
  List<Categorie> categories = [];
  List<Categorie> categorie = [];
  CategoriesCubit(this.categorieRepository) : super(CategoriesInitial());
  List<Categorie> getCategories() {
    categorieRepository.getCategories().then((categories) {
      emit(CategoriesLoaded(categories));
      this.categories = categories;
    });
    return categories;
  }

  List<Categorie> postCategorie(String nom, dynamic image) {
    categorieRepository.postCategorie(nom, image).then((categories) {
      emit(CategoriePosted(categorie));
      categorie = categorie;
    });
    return categorie;
  }
}
