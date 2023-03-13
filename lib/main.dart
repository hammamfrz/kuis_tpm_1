import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[ProfileMenu(), Triangle(), Kite()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Rectangle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Kite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/profile.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Hammam Fariz Raharjo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'NIM : 123200062',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Hobi : Bermain Game',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Kelas : IF - B',
            ),
          ]
        ),
      ),
    );
  }
}

class Triangle extends StatefulWidget {
  const Triangle({super.key});

  @override
  _TriangleState createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
  final TextEditingController alasController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController sisi1Controller = TextEditingController();
  final TextEditingController sisi2Controller = TextEditingController();

  double _luasSegitiga = 0;
  double _kelilingSegitiga = 0;

  void _hitungLuas () {
    double alas = double.parse(alasController.text);
    double tinggi = double.parse(tinggiController.text);

    setState(() {
      _luasSegitiga = alas * tinggi / 2;
    });
  }

  void _hitungKeliling () {
    double alas = double.parse(alasController.text);
    double sisi1 = double.parse(sisi1Controller.text);
    double sisi2 = double.parse(sisi2Controller.text);

    setState(() {
      _kelilingSegitiga = alas + sisi1 + sisi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    double luas1 = 0;
    double keliling1 = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Triangle'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: alasController,
              decoration: const InputDecoration(
                hintText: 'Masukkan Alas',
              ),
            ),
            TextField(
              controller: tinggiController,
              decoration: const InputDecoration(
                hintText: 'Masukkan Tinggi',
              ),
            ),
            TextField(
              controller: sisi1Controller,
              decoration: const InputDecoration(
                hintText: 'Masukkan Sisi 1',
              ),
            ),
            TextField(
              controller: sisi2Controller,
              decoration: const InputDecoration(
                hintText: 'Masukkan Sisi 2',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _hitungLuas,
                  child: const Text('Hitung Luas'),
                ),
                ElevatedButton(
                  onPressed: _hitungKeliling,
                  child: const Text('Hitung Keliling'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Luas : $_luasSegitiga',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Keliling : $_kelilingSegitiga',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class Kite extends StatefulWidget {
  const Kite({super.key});

  @override
  _KiteState createState() => _KiteState();
}

class _KiteState extends State<Kite> {
  final TextEditingController diagonal1Controller = TextEditingController();
  final TextEditingController diagonakl2Controller = TextEditingController();
  final TextEditingController sisi1Controller = TextEditingController();
  final TextEditingController sisi2Controller = TextEditingController();

  double _luasLayang = 0;
  double _kelilingLayang = 0;

  void _hitungLuas () {
    double diagonal1 = double.parse(diagonal1Controller.text);
    double diagonal2 = double.parse(diagonakl2Controller.text);

    setState(() {
      _luasLayang = diagonal1 * diagonal2 / 2;
    });
  }

  void _hitungKeliling () {
    double sisi1 = double.parse(sisi1Controller.text);
    double sisi2 = double.parse(sisi2Controller.text);

    setState(() {
      _kelilingLayang = sisi1 + sisi1 + sisi2 + sisi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kite'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: diagonal1Controller,
              decoration: const InputDecoration(
                hintText: 'Masukkan Diagonal 1',
              ),
            ),
            TextField(
              controller: diagonakl2Controller,
              decoration: const InputDecoration(
                hintText: 'Masukkan Diagonal 2',
              ),
            ),
            TextField(
              controller: sisi1Controller,
              decoration: const InputDecoration(
                hintText: 'Masukkan Sisi 1',
              ),
            ),
            TextField(
              controller: sisi2Controller,
              decoration: const InputDecoration(
                hintText: 'Masukkan Sisi 2',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _hitungLuas,
                  child: const Text('Hitung Luas'),
                ),
                ElevatedButton(
                  onPressed: _hitungKeliling,
                  child: const Text('Hitung Keliling'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Luas : $_luasLayang',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Keliling : $_kelilingLayang',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}







