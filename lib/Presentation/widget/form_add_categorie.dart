import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_project_flutter/Business_logic/cubit/categories_cubit.dart';

class FormAddCategorie extends StatefulWidget {
  const FormAddCategorie({Key? key}) : super(key: key);
  @override
  State<FormAddCategorie> createState() => _FormAddCategorieState();
}

class _FormAddCategorieState extends State<FormAddCategorie> {
  late TextEditingController _nameCategoryController;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _nameCategoryController = TextEditingController();
  }

  var path;
  var imagecloud = "";
  final cloudinary =
      CloudinaryPublic('iset-sfax', 'Ecommerce_cloudinary', cache: false);
  ImagePicker picker = ImagePicker();
  void _pickcamera() {
    setState(() async {
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      path = File(image!.path);
      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image),
        );
        print(response.secureUrl);
        setState(() {
          imagecloud = response.secureUrl;
        });
      } on CloudinaryException catch (e) {
        print(e.message);
        print(e.request);
      }
    });
  }

  void _pickgallery() {
    setState(() async {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      path = File(image!.path);
      try {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image.path,
              resourceType: CloudinaryResourceType.Image),
        );
        print(response.secureUrl);
        setState(() {
          imagecloud = response.secureUrl;
        });
      } on CloudinaryException catch (e) {
        print(e.message);
        print(e.request);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final categorieBloc = BlocProvider.of<CategoriesCubit>(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
                controller: _nameCategoryController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.filter_frames_sharp),
                    hintText: "Category Name",
                    labelText: "Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                }),
            Container(
              height: 40.0,
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  icon:
                      const Icon(Icons.photo_album_rounded, color: Colors.pink),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                  ),
                  onPressed: () {
                    _pickgallery();
                  },
                  label: const Text(
                    "PICK FROM GALLERY",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 40.0,
                ),
                ElevatedButton.icon(
                  icon:
                      const Icon(Icons.camera_alt_sharp, color: Colors.purple),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent,
                  ),
                  onPressed: () {
                    _pickcamera();
                  },
                  label: const Text(
                    "PICK FROM CAMERA",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 40.0,
                ),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: imagecloud != ""
                      ? Image.network('${imagecloud}')
                      : Container(
                          decoration: BoxDecoration(color: Colors.red[200]),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
                Container(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.cyan),
                    ),
                    onPressed: () {
                      // Retourne true si le formulaire est valide, sinon false
                      if (_formKey.currentState!.validate()) {
                        print(_nameCategoryController.text);
                        print(imagecloud);
                        categorieBloc.postCategorie(_nameCategoryController.text, imagecloud);
                        // Affiche le Snackbar si le formulaire est valide
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text(
                      "submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
