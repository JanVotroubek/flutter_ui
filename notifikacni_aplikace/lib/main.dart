import 'package:flutter/material.dart';
import 'package:notifikacni_aplikace/settings.dart';
import 'notifications.dart';
import 'about.dart';
import 'profile.dart';
import 'login.dart';


void main() {
  runApp(Login());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotifyAPP',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarName(),
      body: AppBarScreen(),
      drawer: AppDrawer(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
    );
  }
}

class AppBarName extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppBarName({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        iconSize: 26,
        icon: const Icon(Icons.menu),
        color: const Color(0xFFfefae0),
        onPressed: () {
          Scaffold.of(context).openDrawer();
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
      titleSpacing: 0,
    );
  }
}

class AppBarScreen extends StatelessWidget {
  const AppBarScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Vítejte v aplikaci MVČR pro notifikace',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ], // Children
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AppBar(
          backgroundColor: const Color(0xFF606c38),
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
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                      builder: (context) => MainApp(),
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
                      builder: (context) => NotificationsPage()
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
                        scaffoldKey: GlobalKey<ScaffoldState>()
                      ),
                    ),
                  );// Handle the tap
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
                      builder: (context) => ProfileApp(),
                    ),
                  ); // Handle the tap
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
          leading: const Icon(Icons.info),
          title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutApp(),
                    ),
                  ); // Handle the tap
                },
              ),

        ListTile(
          tileColor: const Color(0xFFfefae0),
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
                ),
              ); // Handle the tap
            },
          ),
        ],
      ),
    );
  }
}