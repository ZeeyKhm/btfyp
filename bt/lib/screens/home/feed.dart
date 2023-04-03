import 'package:flutter/material.dart';
import 'package:brunei_tourism/screens/home/upload_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brunei_tourism/screens/home/upload.dart';

class Feed extends StatelessWidget {
  Feed({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('story');

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents.map((e) => e.data() as Map).toList();

            //Display the list
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //REturn the widget for the list items
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black54, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 300,
                        child: thisItem.containsKey('image')
                            ? Image.network('${thisItem['image']}',
                                fit: BoxFit.cover)
                            : Container(),
                      ),
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  '${thisItem['title']} by ${thisItem['username']}\n',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: '${thisItem['description']}',
                          ),
                        ],
                      ),
                    ),
                    // leading: SizedBox(
                    //   height: 300,
                    //   width: 300,
                    //   child: thisItem.containsKey('image')
                    //       ? Image.network('${thisItem['image']}',
                    //           fit: BoxFit.cover)
                    //       : Container(),
                    // ),
                    // onTap: () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => UploadDetails(thisItem['id'])));
                    // },
                  );
                });
          }

          //Show loader
          return const Center(child: CircularProgressIndicator());
        },
      ), //Display a list // Add a FutureBuilder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Upload()));
        },
        tooltip: 'Upload Image',
        child: const Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}

  

  

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates

