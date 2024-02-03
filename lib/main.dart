import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomTaskList(),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomTaskList extends StatefulWidget {
  const CustomTaskList({Key? key}) : super(key: key);

  @override
  _CustomTaskListState createState() => _CustomTaskListState();
}

class _CustomTaskListState extends State<CustomTaskList> {
  bool _isCheckedStudy = false;
  bool _isCheckedPersonal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.cloud_queue),
                  title: Text('Cloud Services'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.security),
                  title: Text('Device Storage'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.drive_eta),
                  title: Text('My Drive'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.cloud_circle),
                  title: Text('Cloud Sync'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.delete_forever),
                  title: Text('Recently Deleted'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.download_rounded),
                  title: Text('Downloads'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Study'),
                  value: _isCheckedStudy,
                  onChanged: (value) {
                    setState(() {
                      _isCheckedStudy = value!;
                      if (_isCheckedStudy && _isCheckedPersonal) {
                        _isCheckedPersonal = false;
                      }
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Personal'),
                  value: _isCheckedPersonal,
                  onChanged: (value) {
                    setState(() {
                      _isCheckedPersonal = value!;
                      if (_isCheckedPersonal && _isCheckedStudy) {
                        _isCheckedStudy = false;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomSearchTextField(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_time),
                  label: 'Recientes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.folder_shared),
                  label: 'Compartidos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Explorar',
                ),
              ],
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey,
              currentIndex: 0,
              onTap: (index) {
                // Maneja la navegación entre las categorías aquí si es necesario
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  _CustomSearchTextFieldState createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: 'Search here');
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      color: Colors.grey[300],
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

