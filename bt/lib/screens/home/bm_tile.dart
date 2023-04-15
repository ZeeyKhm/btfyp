import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(BmTile());

class BmTile extends StatelessWidget {
  BmTile({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('bm');

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Brunei Muara'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            List<Map> items = documents.map((e) => e.data() as Map).toList();

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Map thisItem = items[index];

                  return Center(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: SizedBox(
                              height: 300,
                              child: thisItem.containsKey('image')
                                  ? Image.network('${thisItem['image']}',
                                      fit: BoxFit.cover)
                                  : Container(),
                            ),
                            title: Text('${thisItem['title']}'),
                            subtitle: Text('${thisItem['sub']}'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black),
                                child: const Text('Link'),
                                onPressed: () async {
                                  if (!await launchUrl(
                                      Uri.parse('${thisItem['link']}'))) {
                                    throw Exception('Could not launch link');
                                  }
                                },
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.black),
                                  child: const Text('Call'),
                                  onPressed: () async {
                                    if (!await launchUrl(
                                        Uri.parse('${thisItem['tel']}'))) {
                                      throw Exception(
                                          'Could not launch contacts');
                                    }
                                  }),
                              const SizedBox(width: 1),
                              TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.black),
                                child: const Text('Direction'),
                                onPressed: () {
                                  MapUtils.openMap(thisItem['loc']);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(String location) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$location';

    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
