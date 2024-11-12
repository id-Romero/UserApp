import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String age;
  final String occupation;

  ProfileScreen({required this.name, required this.age, required this.occupation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IconTheme(
          data: IconThemeData(color: Colors.blueAccent, size: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileData('Nombre', name, Icons.person),
              SizedBox(height: 15),
              _buildProfileData('Edad', age, Icons.calendar_today),
              SizedBox(height: 15),
              _buildProfileData('Ocupación', occupation, Icons.work),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home, color: Colors.white),
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        backgroundColor: Colors.black,
        tooltip: 'Regresar a Inicio',
      ),
    );
  }

  Widget _buildProfileData(String label, String data, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon),
        title: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(data, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
