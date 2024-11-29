import 'package:flutter/material.dart';
import 'main.dart';

class NotificationsApp extends StatelessWidget {
  const NotificationsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotifyAPP',
      home: NotificationsPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => NotificationsApp(),
        '/history': (context) => const NotificationHistoryScreen(),
        '/my_notifications': (context) => const MyNotificationsScreen(),
        '/urgent_notifications': (context) => const UrgentNotificationsScreen(),
      },
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarName(),
      drawer: AppDrawer(),
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

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF606c38),
                        foregroundColor: Colors.white,
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
                        backgroundColor: const Color(0xFF606c38), 
                        foregroundColor: Colors.white,
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
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
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