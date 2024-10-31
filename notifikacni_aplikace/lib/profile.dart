import 'package:flutter/material.dart';
import 'main.dart';
// Import the SystemNavigator class

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nAPP MVČR',
      home: AppBarScreen(title: 'nAPP MVČR', scaffoldKey: scaffoldKey),
    );
  }
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({super.key, required this.title, required this.scaffoldKey});
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBarName(scaffoldKey: widget.scaffoldKey),
      drawer: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        child: const Drawer(
          child: AppDrawer(),
        ),
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width, // Set the drag width to the full width of the screen
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFfefae0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(text: 'Detail Text 1', tag: 'detail1'),
                  ),
                );
              },
              child: Hero(
                tag: 'detail1',
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Open Detail 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(text: 'Detail Text 2', tag: 'detail2'),
                  ),
                );
              },
              child: Hero(
                tag: 'detail2',
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Open Detail 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFfefae0),
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text('Some other content here'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  final String text;
  final String tag;

 const DetailScreen({super.key, required this.text, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Center(
        child: Hero(
          tag: tag,
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

// Function to build the app bar
AppBar buildAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    leading: IconButton(
      iconSize: 26,
      icon: const Icon(Icons.menu),
      color: const Color(0xFFfefae0),
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
    ),
    actions: [
      Image.asset(
        'images/mvcr_znak.png',
        width: 50,
        height: 50,
      ),
      const Padding(padding: EdgeInsets.only(right: 10)),
    ],
    backgroundColor: const Color(0xFF606c38),
    title: const Text(
      'Ministerstvo vnitra ČR',
      style: TextStyle(
        fontSize: 22.5,
        fontFamily: 'Rethink Sans',
        fontWeight: FontWeight.bold,
        color: Color(0xFFfefae0),
      ),
    ),
        titleSpacing: 0
  );
}