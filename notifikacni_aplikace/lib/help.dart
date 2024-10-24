import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'notifications.dart';
import 'about.dart';
import 'main.dart';
import 'profile.dart';
import 'settings.dart';


void main() {
  runApp(HelpPage(scaffoldKey: scaffoldKey));
}

class HelpPage extends StatelessWidget {
  const HelpPage({super.key, required this.scaffoldKey});
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
          child: AppDrawerHelp(),
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
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFfefae0),
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Help Page',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
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

// Class for the main drawer
class AppDrawerHelp extends StatelessWidget {
  const AppDrawerHelp({super.key});

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