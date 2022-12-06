import 'package:flutter/material.dart';
import 'package:my_project_flutter/Data/models/categorie.dart';
import 'package:my_project_flutter/constants/colors.dart';

class CategorieItem extends StatelessWidget {
  final Categorie categorie;
  final index;
  const CategorieItem({Key? key, required this.index, required this.categorie})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColor.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        child: GridTile(
          // ignore: sort_child_properties_last
          child: Hero(
            tag: index,
            child: Container(
              color: MyColor.myGrey,
              child: categorie.imagecategorie!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: categorie.imagecategorie!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${categorie.nomcategorie}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColor.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
