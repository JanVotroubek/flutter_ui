import 'package:flutter/material.dart';
import 'main.dart';


void main() {
  runApp(const NotificationsApp());
}

class NotificationsApp extends StatelessWidget {
  const NotificationsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'nAPP MVČR',
      initialRoute: '/',
      routes: {
        '/': (context) => NotificationsPage(scaffoldKey: GlobalKey<ScaffoldState>()),
        '/history': (context) => const NotificationHistoryScreen(),
        '/my_notifications': (context) => const MyNotificationsScreen(),
        '/urgent_notifications': (context) => const UrgentNotificationsScreen(),
      },
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key, required this.scaffoldKey});
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
      appBar: AppBarName(scaffoldKey: widget.scaffoldKey),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Notifications Page',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Button for Notification History
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF606c38), // Zde změníš barvu pozadí
                        foregroundColor: Colors.white, // Barva textu
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/history');
                      },
                      child: const Text('History of notifications'),
                    ),
                    const SizedBox(height: 10),

                    // Button for My Notifications
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF606c38), // Zde změníš barvu pozadí
                        foregroundColor: Colors.white, // Barva textu
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/my_notifications');
                      },
                      child: const Text('My notifications'),
                    ),
                    const SizedBox(height: 10),

                    // Button for Urgent Notifications
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Zde změníš barvu pozadí
                        foregroundColor: Colors.white, // Barva textu
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/urgent_notifications');
                      },
                      child: const Text('Urgent notifications'),
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

class NotificationHistoryScreen extends StatelessWidget {
  const NotificationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History of notifications'),
      ),
      body: const Center(
        child: Text('History of notifications Page'),
      ),
    );
  }
}

class MyNotificationsScreen extends StatelessWidget {
  const MyNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My notifications'),
      ),
      body: const Center(
        child: Text('My notifications Page'),
      ),
    );
  }
}

class UrgentNotificationsScreen extends StatelessWidget {
  const UrgentNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urgent notifications'),
      ),
      body: const Center(
        child: Text('Urgent notifications Page'),
      ),
    );
  }
}
