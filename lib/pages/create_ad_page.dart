import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Page pour créer une annonce
class CreateAdPage extends StatefulWidget {
  const CreateAdPage({super.key});

  @override
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  File? _image; // Variable pour stocker l'image prise
  final ImagePicker _picker = ImagePicker(); // Instance de ImagePicker

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Met à jour l'image prise
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une annonce'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Créer une annonce',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.camera_alt, color: Colors.black),
                label: const Text('Prendre une photo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Bouton gris
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              _image != null
                  ? Image.file(_image!, height: 200) // Affiche l'image prise
                  : const Text("Aucune image sélectionnée"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action pour ajouter une annonce (exemple)
                  print('Annonce ajoutée');
                },
                child: const Text('Ajouter une annonce'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}