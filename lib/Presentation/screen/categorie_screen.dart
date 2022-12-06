import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project_flutter/Business_logic/cubit/categories_cubit.dart';
import 'package:my_project_flutter/Data/models/categorie.dart';
import 'package:my_project_flutter/Presentation/widget/category_item.dart';
import 'package:my_project_flutter/constants/colors.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({Key? key}) : super(key: key);
  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  late List<Categorie> getCategories;
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CategoriesCubit>(context).getCategories();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          getCategories = (state).categories;
          return builLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColor.myYellow,
      ),
    );
  }

  Widget builLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
          color: MyColor.myGrey,
          child: Column(
            children: [
              buildCharactersList(),
            ],
          )),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: getCategories.length,
        itemBuilder: (ctx, index) {
          return CategorieItem(index: index, categorie: getCategories[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            color: Colors.yellow,
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushNamed("/addcateg");
            },
            icon: const Icon(Icons.add_circle_rounded),
          ),
        ],
      ),
      body: buildBlocWidget(),
    );
  }
}
