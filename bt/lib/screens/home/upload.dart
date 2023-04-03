import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerUploader = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('story');

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Upload Story'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerTitle,
                decoration: const InputDecoration(hintText: 'Title'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerDescription,
                decoration: const InputDecoration(hintText: 'Description'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the description';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerUploader,
                decoration: const InputDecoration(hintText: 'Username'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Username';
                  }

                  return null;
                },
              ),
              IconButton(
                  onPressed: () async {
                    /*
                * Step 1. Pick/Capture an image   (image_picker)
                * Step 2. Upload the image to Firebase storage
                * Step 3. Get the URL of the uploaded image
                * Step 4. Store the image URL inside the corresponding
                *         document of the database.
                * Step 5. Display the image on the list
                *
                * */

                    /*Step 1:Pick image*/
                    //Install image_picker
                    //Import the corresponding library

                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    print('${file?.path}');

                    if (file == null) return;
                    //Import dart:core
                    String uniqueFileName =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    /*Step 2: Upload to Firebase storage*/
                    //Install firebase_storage
                    //Import the library

                    //Get a reference to storage root
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child('images');

                    //Create a reference for the image to be stored
                    Reference referenceImageToUpload =
                        referenceDirImages.child(uniqueFileName);

                    //Handle errors/success
                    try {
                      //Store the file
                      await referenceImageToUpload.putFile(File(file.path));
                      //Success: get the download URL
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      //Some error occurred
                    }
                  },
                  icon: const Icon(Icons.camera_alt)),
              ElevatedButton(
                  onPressed: () async {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please upload an image')));

                      return;
                    }

                    if (key.currentState!.validate()) {
                      String imageTitle = _controllerTitle.text;
                      String imageDescription = _controllerDescription.text;
                      String imageUploader = _controllerUploader.text;

                      //Create a Map of data
                      Map<String, String> dataToSend = {
                        'title': imageTitle,
                        'description': imageDescription,
                        'image': imageUrl,
                        'username': imageUploader,
                      };

                      //Add a new item
                      _reference.add(dataToSend);
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
