import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project_flutter/Business_logic/cubit/categories_cubit.dart';
import 'package:my_project_flutter/Data/repository/categories_repository.dart';
import 'package:my_project_flutter/Data/web_services/categorie_service.dart';
import 'package:my_project_flutter/Presentation/screen/ajout_categorie_screen.dart';
import 'package:my_project_flutter/Presentation/screen/categorie_screen.dart';
import 'package:my_project_flutter/constants/strings.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case categorieScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                CategoriesCubit(CategorieRepository(CategorieService())),
            child: const CategorieScreen(),
          ),
        );
      case categorieAddScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                     CategoriesCubit(CategorieRepository(CategorieService())),
                  child: const AjoutCategorie(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
