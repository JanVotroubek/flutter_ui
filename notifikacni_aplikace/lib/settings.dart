import 'package:flutter/material.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.scaffoldKey});
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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Settings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'Rethink Sans',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1,
                      wordSpacing: 0,
                      decoration: TextDecoration.underline
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'This app was developed by Jan Votroubek during years 2024-25.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Rethink Sans',
                      letterSpacing: 0,
                      wordSpacing: 0
                    ),
                  ),
                ],
              ),
            ),

          /* Spacer(),
          Text(
          'Created by: Jan Votroubek, 2024-2025',
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              color: Colors.grey[500],
            ),
          ), */

          ],
        ),
      ),
    );
  }
}