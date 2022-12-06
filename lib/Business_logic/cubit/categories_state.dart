part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Categorie> categories;
  CategoriesLoaded(this.categories);
}
class CategoriePosted extends CategoriesState { 
 final List<Categorie> categorie; 
 CategoriePosted(this.categorie); 
} 
