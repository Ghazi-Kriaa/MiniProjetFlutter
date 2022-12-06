import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project_flutter/Business_logic/cubit/categories_cubit.dart';
import 'package:my_project_flutter/Presentation/widget/form_add_categorie.dart';
import 'package:my_project_flutter/constants/strings.dart';

class AjoutCategorie extends StatelessWidget {
  const AjoutCategorie({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        Navigator.of(context).pushNamed(categorieScreen);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 15,
            backgroundColor: Colors.cyan[500],
            title: const Text("ADD"),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
          ),
          body: const FormAddCategorie(),
        ),
      ),
    );
  }
}
