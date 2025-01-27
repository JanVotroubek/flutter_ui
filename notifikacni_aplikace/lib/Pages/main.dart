import 'package:flutter/material.dart';
import 'package:notifikacni_aplikace/Pages/settings.dart';
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
    );
  }
}

class AppBarName extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppBarName({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    bool isPhone = screenWidth < 500 && screenWidth >= 375;
    bool isLargePhone = screenWidth >= 500 && screenWidth < 750;
    bool isTablet = screenWidth >= 750;

    // Dynamická velikost písma podle šířky
    double fontSize = 0;
    if (isPhone) {
      fontSize = (screenWidth * 0.08).clamp(16.0, 24.0); // Malé telefony
    } else if (isLargePhone) {
      fontSize = (screenWidth * 0.1).clamp(20.0, 30.0); // Větší telefony
    } else if (isTablet) {
      fontSize = (screenWidth * 0.12).clamp(24.0, 36.0); // Tablety a větší zařízení
    } else if (screenWidth <= 375) {
      fontSize = 19;
    }

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
          width: 45
        ),
        const Padding(padding: EdgeInsets.only(right: 15),
        ),
      ],
      backgroundColor: const Color(0xFF606c38),
      title: Text(
        'Ministerstvo vnitra ČR',
        style: TextStyle(
          fontSize: fontSize,
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

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final GlobalKey columnKey = GlobalKey();
  double columnHeight = 0;

  @override
  void initState() {
    super.initState();

    // Zavoláme po vykreslení widgetu
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getColumnHeight(columnKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;    
    bool isPhone = screenWidth < 500 && screenWidth >= 375;
    bool isLargePhone = screenWidth >= 500 && screenWidth < 750;
    bool isTablet = screenWidth >= 750;

    // Dynamická velikost písma podle šířky
    double fontSize = 0;
    if (isPhone) {
      fontSize = (screenWidth * 0.08).clamp(16.0, 28.0); // Malé telefony
    } else if (isLargePhone) {
      fontSize = (screenWidth * 0.1).clamp(20.0, 30.0); // Větší telefony
    } else if (isTablet) {
      fontSize = (screenWidth * 0.12).clamp(24.0, 34.0); // Tablety a větší zařízení
    }
    else if (screenWidth <= 375) {
      fontSize = 20;
    }
    // Dynamická šířka Draweru podle šířky obrazovky
    double drawerWidth = 0;
    if (isPhone) {
      drawerWidth = 250;  // Menší Drawer pro telefony
    } else if (isLargePhone) {
      drawerWidth = 280;  // Trochu širší pro větší telefony
    } else if (isTablet) {
      drawerWidth = 310;  // Větší Drawer pro tablety a větší zařízení
    }
    else if (screenWidth <= 375) {
      drawerWidth = 220;
    }

    return Drawer(
      width: drawerWidth,
      child: Column(
        key: columnKey,
        children: <Widget>[
          AppBar(
            backgroundColor: const Color(0xFF606c38),
            title: Row(
              children: [
                const SizedBox(width: 8),
                Text(
                  'MENU',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFfefae0),
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
          
          _buildDrawerItem(
            padding: Padding(padding: EdgeInsets.all(10)),
            context: context,
            icon: Icons.home,
            title: 'Home',
            page: MainApp(),
          ),
          _buildDrawerItem(
            padding: Padding(padding: EdgeInsets.all(10)),
            context: context,
            icon: Icons.notifications,
            title: 'Notifications',
            page: NotificationsPage(),
          ),
          _buildDrawerItem(
            padding: Padding(padding: EdgeInsets.all(10)),
            context: context,
            icon: Icons.settings,
            title: 'Settings',
            page: SettingsPage(
              scaffoldKey: GlobalKey<ScaffoldState>(),
            ),
          ),
          _buildDrawerItem(
            padding: Padding(padding: EdgeInsets.all(10)),
            context: context,
            icon: Icons.person,
            title: 'Profile',
            page: ProfileApp(),
          ),

          Container(
            height: columnHeight - 6 * 48 - 56,
            width: double.infinity,
            color: const Color(0xFFfefae0),
          ), // Mezera mezi Profile a About

          _buildDrawerItem(
            padding: Padding(padding: EdgeInsets.all(10)),
            context: context,
            icon: Icons.info,
            title: 'About',
            page: AboutApp(),
          ),
          _buildDrawerItem(
            padding: Padding(padding: EdgeInsets.all(10)),
            context: context,
            icon: Icons.logout,
            title: 'Logout',
            page: LoginPage(),
          ),
        ],
      ),
    );
  }

  void getColumnHeight(GlobalKey key) {
    final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    setState(() {
      columnHeight = size.height; // Získání výšky Column
    });
  }

  Widget _buildDrawerItem({
    required Padding padding,
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget page,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPhone = screenWidth < 500;
    bool isLargePhone = screenWidth >= 500 && screenWidth < 750;
    bool isTablet = screenWidth >= 750;

    // Dynamická velikost písma podle šířky
    double fontSize = 0;
    if (isPhone) {
      fontSize = (screenWidth * 0.08).clamp(12.0, 16.0); // Malé telefony
    } else if (isLargePhone) {
      fontSize = (screenWidth * 0.1).clamp(16.0, 18.0); // Větší telefony
    } else if (isTablet) {
      fontSize = (screenWidth * 0.12).clamp(18.0, 20.0); // Tablety a větší zařízení
    }

    return ListTile(
      tileColor: const Color(0xFFfefae0),
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontSize: fontSize)),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}