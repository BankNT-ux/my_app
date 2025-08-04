import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Map<String, dynamic>> apps = [
    {'name': 'Facebook', 'iconPath': 'assets/images/FacebookLogo.png', 'selected': true},
    {'name': 'LINE', 'iconPath': 'assets/images/LineLogo11.png', 'selected': true},
    {'name': 'K PLUS', 'iconPath': 'assets/images/kplusLogo.png', 'selected': true},
    {'name': 'SCB EASY', 'iconPath': 'assets/images/ScbLogo.png', 'selected': true},
    {'name': 'NEXT', 'iconPath': 'assets/images/NextLogo.png', 'selected': true},
    {'name': 'TikTok', 'iconPath': 'assets/images/TiktokLogo.png', 'selected': true},
    {'name': 'Instagram', 'iconPath': 'assets/images/IgLogo.png', 'selected': true},
    {'name': 'ทางรัฐ', 'iconPath': 'assets/images/TlLogo.png', 'selected': true},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredApps = apps
        .where((app) => app['name'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFF7B81D1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Setting', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/news.png',
              width: 48,
              height: 48,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DownloadPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsDetailPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredApps.length,
              itemBuilder: (context, index) {
                final app = filteredApps[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    tileColor: Colors.transparent,
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(app['iconPath']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      app['name'],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    trailing: Checkbox(
                      value: app['selected'],
                      activeColor: Colors.deepPurple.shade200,
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          app['selected'] = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// หน้า DownloadPage
class DownloadPage extends StatelessWidget {
  final List<String> newsList = [
    'News: เนื้อหาข่าว...'


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Page')),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(newsList[index]),
            trailing: IconButton(
              icon: Icon(Icons.download),
              onPressed: () {
                // ใส่โค้ดดาวน์โหลดข่าว หรือฟังก์ชันที่ต้องการตรงนี้
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('ดาวน์โหลดข่าว: ${newsList[index]}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


// หน้า Settings ใหม่
class SettingsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings Detail')),
      body: Center(
        child: Text(
          'Setting',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
