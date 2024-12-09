import 'package:flutter/material.dart';
import 'package:barbershop/components/auth_gate.dart';
import '/pages/favourite.dart';
import 'models/global_data.dart';
import 'pages/cart.dart';
import 'pages/catalog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

GlobalData appData = GlobalData();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appData.firebaseInitialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await appData.fetchAllData();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const Catalog(),
    const Favourite(),
    const Cart(),
    AuthGate()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.cut), label: "Стрижки"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Избранные"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: "Запись"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurple,
          currentIndex: selectedIndex,
          useLegacyColorScheme: true,
          onTap: (int barItemIndex) => {
            setState(() {
              selectedIndex = barItemIndex;
            })
          },
        ),
      ),
    );
  }
}
