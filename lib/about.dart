import 'package:flutter/material.dart';
import 'notifications.dart';
import 'main.dart'; 
import 'help.dart';
import 'package:flutter/services.dart';
import 'settings.dart';
import 'profile.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key, required this.scaffoldKey});
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
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        child: Drawer(
          child: AppDrawerAbout(),
        ),
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width, // Set the drag width to the full width of the screen
      body: Container(
        padding: EdgeInsets.only(top: 40, bottom: 20),
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFfefae0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFfefae0),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('images/mvcr_znak.png', width: 125, height: 125),
                  ),
                  SizedBox(height: 16),
                  Text(
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
                  SizedBox(height: 16),
                  Text(
                    'Creators: Jan Votroubek \nYears of developing: 2024 \nVersion: 1.0.0 \n\n\nThis app was created as a project for the subject of Mobile Applications Development at High School and college of applied cybernetics. The app is a fictional application for the Ministry of the Interior of the Czech Republic. The app is used to notify citizens of important events and news. The app also allows citizens to set up their own profile and customize the app to their liking. The app is still in development and new features will be added in the future.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Rethink Sans',
                      wordSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),

          Spacer(),
          Text(
          'Created by: Jan Votroubek, 2024-2025',
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              color: Colors.grey[500],
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
      color: Color(0xFFfefae0),
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
    backgroundColor: Color(0xFF606c38),
    title: Text(
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AppBar(
          backgroundColor: Color(0xFF283618),
          title: Row(
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
            color: Color(0xFFfefae0),
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
                tileColor: Color(0xFFfefae0),
                leading: Icon(Icons.home),
                title: Text('Home'),
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
                tileColor: Color(0xFFfefae0),
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
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
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                tileColor: Color(0xFFfefae0),
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
                tileColor: Color(0xFFfefae0),
                leading: Icon(Icons.person),
                title: Text('Profile'),
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
                tileColor: Color(0xFFfefae0),
                leading: Icon(Icons.info),
                title: Text('About'),
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
                color: Color(0xFFfefae0), // Same color as ListTile
                height: 1000,
              ),
            ],
          ),
        ),
          ListTile(
          tileColor: Color(0xFFfefae0),
          leading: Icon(Icons.help),
          title: Text('Help'),
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
          tileColor: Color(0xFFfefae0),
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            SystemNavigator.pop();// Handle the tap
          },
        ),
      ],
    );
  }
}