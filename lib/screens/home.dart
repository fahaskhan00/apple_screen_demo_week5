import 'package:flutter/material.dart';


import 'package:flutter_application_2/screens/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/apl.jpg',
      'name': 'Apple Store',
      'postImage': 'assets/images/apls.jpg',
      'Sub': 'Apple CAlifornia ',
      'text':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
    },
    {
      'image': 'assets/images/goog.jpg',
      'name': 'Google Store',
      'postImage': 'assets/images/googles.jpg',
      'Sub': 'Google London',
      'text':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book It has survived not only five centuries but also the leap into electronic typesetting remaining essentially unchanged.It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
    },
    {
      'image': 'assets/images/ac.jpg',
      'name': 'Acer Store',
      'postImage': 'assets/images/acs.jpg',
      'Sub': 'America',
      'text':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
    },
    {
      'image': 'assets/images/puma1.jpg',
      'name': 'PUMA',
      'postImage': 'assets/images/pumas.jpg',
      'Sub': 'Russia',
      'text':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            onPressed: () {
              logoutDialog(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      // Body
      body: ListView.builder(
        
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Column(
              children: [
                       
                ListTile(
                  title: Text(items[index]['name']),
                  subtitle: Text(items[index]['Sub']),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(items[index]['image']),
                  ),
                ),

                Divider(),

                //Image Space

                Container(
                  height: 360,
                  width: 376,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(items[index]['postImage']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Text Space

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      items[index]['text'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }

  // Logout Function

  void  logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Logout"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.clear();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx1) => const LoginScreen()),
                  (route) => false,
                );
              }, 
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
