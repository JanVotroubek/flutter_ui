import 'package:flutter/material.dart';
import 'notifications.dart';
import 'main.dart'; 
import 'help.dart';
import 'package:flutter/services.dart';
import 'settings.dart';
import 'profile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.scaffoldKey});
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
      appBar: buildAppBar(context, widget.scaffoldKey),
      drawer: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        child: const Drawer(
          child: AppDrawerAbout(),
        ),
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width, // Set the drag width to the full width of the screen
      body: Container(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFfefae0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFfefae0),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('images/mvcr_znak.png', width: 125, height: 125),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'About ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Rethink Sans',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Creators: Jan Votroubek & Maxim Albrecht \nYears of developing: 2024 \nVersion: 1.0.0 \n\n\nThis app was created as a project for the subject of Mobile Applications Development at High School and college of applied cybernetics. The app is a fictional application for the Ministry of the Interior of the Czech Republic. The app is used to notify citizens of important events and news. The app also allows citizens to set up their own profile and customize the app to their liking. The app is still in development and new features will be added in the future.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Rethink Sans',
                      wordSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        width: 75,
        height: 75,
      ),
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

// Class for the main drawer
class AppDrawerAbout extends StatelessWidget {
  const AppDrawerAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AppBar(
          backgroundColor: const Color(0xFF283618),
          title: const Row(
            children: [
              SizedBox(width: 8), 
              Text(
                'MENU',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFfefae0),
                ),
              ),
            ],
          ),
          titleSpacing: 0,
          leading: IconButton(
            iconSize: 26,
            color: const Color(0xFFfefae0),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
  ListTile(
                tileColor: const Color(0xFFfefae0),
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(
                        scaffoldKey: GlobalKey<ScaffoldState>(),
                      ),
                    ),
                  );
                },
              ),
               ListTile(
                tileColor: const Color(0xFFfefae0),
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsPage(
                        scaffoldKey: GlobalKey<ScaffoldState>(),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                tileColor: const Color(0xFFfefae0),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        scaffoldKey: GlobalKey<ScaffoldState>(),
                      ),
                    ),
                  );
                  // Handle the tap
                },
              ),
              ListTile(
                tileColor: const Color(0xFFfefae0),
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        scaffoldKey: GlobalKey<ScaffoldState>(),
                      ),
                    ),
                  );
                  // Handle the tap
                },
              ),
              ListTile(
                tileColor: const Color(0xFFfefae0),
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutPage(
                        scaffoldKey: GlobalKey<ScaffoldState>(),
                        ),
                      ),
                    );                  // Handle the tap
                },
              ),
                Container(
                color: const Color(0xFFfefae0), // Same color as ListTile
                height: 1000,
              ),
            ],
          ),
        ),
          ListTile(
          tileColor: const Color(0xFFfefae0),
          leading: const Icon(Icons.help),
          title: const Text('Help'),
          onTap: () {
            Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HelpPage(
                        scaffoldKey: GlobalKey<ScaffoldState>(),
                        ),
                      ),
                    );
            // Handle the tap
          },
        ),

        ListTile(
          tileColor: const Color(0xFFfefae0),
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            SystemNavigator.pop();// Handle the tap
          },
        ),
      ],
    );
  }
}