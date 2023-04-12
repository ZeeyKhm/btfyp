import 'package:brunei_tourism/models/profile.dart';
import 'package:brunei_tourism/screens/home/feed.dart';
import 'package:brunei_tourism/screens/home/profile_list.dart';
import 'package:brunei_tourism/screens/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brunei_tourism/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brunei_tourism/models/profile.dart';
import 'package:brunei_tourism/screens/home/map_tile.dart';
import 'package:brunei_tourism/screens/home/emergency.dart';
import 'package:brunei_tourism/screens/home/home_tile.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/loading.dart';

final Uri _url = Uri.parse('tel:+999');

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeTile(),
    Feed(),
    const Text(
      '',
      style: optionStyle,
    ),
    const MapTile(),
    const EmergencyTile(),
  ];

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Profile>>.value(
      value: DatabaseService(uid: '').profiles,
      initialData: const [],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(),
                  );
                },
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
          centerTitle: true,
          title: const Text('Brunei Tourism'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _launchUrl();
          },
          tooltip: 'Alert',
          backgroundColor: Colors.red,
          foregroundColor: Colors.yellow,
          child: const Icon(Icons.add_alert_sharp),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          elevation: 0,
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black87,
              selectedItemColor: Colors.grey,
              unselectedItemColor: Colors.grey,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper), label: 'Feed'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: '',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: 'Profile'),
              ],
              onTap: _onItemTapped,
            ),
          ),
          // currentIndex: _selectedIndex,
          // shadowColor: Colors.blue,
          // activeColor: Colors.yellow,
          // style: TabStyle.reactCircle,
        ),
        // body: const ProfileList(),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'brunei muara',
    'tutong',
    'temburong',
    'belait',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var district in searchTerms) {
      if (district.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(district);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var district in searchTerms) {
      if (district.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(district);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

// class Home extends StatelessWidget {
//   Home({super.key});

//   final AuthServices _auth = AuthServices();

  
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
