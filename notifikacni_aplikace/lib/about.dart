import 'package:flutter/material.dart';
import 'main.dart';

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
        padding: const EdgeInsets.only(top: 35, bottom: 10),
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFfefae0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFfefae0),
                      border: Border.all(width: 1.75),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset('images/flutter.png', width: 125, height: 125),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'About',
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
                    'Developers: Jan Votroubek & Maxim Albrecht\n'
                    'Time of development: 17/10/2024 -- Today\n'
                    'Version: 0.0.3\n',
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'This app was created as a project at High School and College of applied cybernetics.\n'
                    'Application is a fictional for use of the Ministry of the Interior of the Czech Republic.\n'
                    'The app is used to notify politicans in MVČR of important events and news. '
                    'The app also allows politicans to set up their own profile and customize the app to their liking.\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Rethink Sans',
                      wordSpacing: 0,
                      letterSpacing: 0,
                    )
                  ),
                  const Text(
                    'The app is still in development and new features will be added in the future.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.5,
                      fontFamily: 'Rethink Sans',
                      wordSpacing: 0,
                      letterSpacing: 0, 
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'Jan Votroubek & Maxim Albrecht, 2024-2025',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Rethink Sans',
                fontSize: 9,
                color: Colors.grey[500],
                wordSpacing: 0,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}