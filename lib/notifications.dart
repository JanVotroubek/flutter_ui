import 'package:flutter/material.dart';

void main() {
  runApp(NotificationsApp());
}

class NotificationsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nAPP MVČR',
      initialRoute: '/',
      routes: {
        '/': (context) => NotificationsPage(scaffoldKey: GlobalKey<ScaffoldState>()),
        '/history': (context) => NotificationHistoryScreen(),
        '/my_notifications': (context) => MyNotificationsScreen(),
        '/urgent_notifications': (context) => UrgentNotificationsScreen(),
      },
    );
  }
}

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(title: 'nAPP MVČR', scaffoldKey: scaffoldKey);
  }
}

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
      drawer: Drawer(
        child: AppDrawerMain(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFfefae0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFfefae0),
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Notifications Page',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Button for Notification History
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF606c38), // Zde změníš barvu pozadí
                        foregroundColor: Colors.white, // Barva textu
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/history');
                      },
                      child: Text('History of notifications'),
                    ),
                    SizedBox(height: 10),

                    // Button for My Notifications
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF606c38), // Zde změníš barvu pozadí
                        foregroundColor: Colors.white, // Barva textu
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/my_notifications');
                      },
                      child: Text('My notifications'),
                    ),
                    SizedBox(height: 10),

                    // Button for Urgent Notifications
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Zde změníš barvu pozadí
                        foregroundColor: Colors.white, // Barva textu
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/urgent_notifications');
                      },
                      child: Text('Urgent notifications'),
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
    titleSpacing: 0,
  );
}

class AppDrawerMain extends StatelessWidget {
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
                },
              ),
              ListTile(
                tileColor: Color(0xFFfefae0),
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                tileColor: Color(0xFFfefae0),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: Color(0xFFfefae0),
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            Container(
              color: const Color(0xFFfefae0),
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
          },
        ),
        ListTile(
          tileColor: Color(0xFFfefae0),
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            // Exit the app
          },
        ),
      ],
    );
  }
}

class NotificationHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History of notifications'),
      ),
      body: Center(
        child: Text('History of notifications Page'),
      ),
    );
  }
}

class MyNotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My notifications'),
      ),
      body: Center(
        child: Text('My notifications Page'),
      ),
    );
  }
}

class UrgentNotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urgent notifications'),
      ),
      body: Center(
        child: Text('Urgent notifications Page'),
      ),
    );
  }
}
