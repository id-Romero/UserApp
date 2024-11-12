import 'package:flutter/material.dart';
import 'profile.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Perfil', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IconTheme(
          data: IconThemeData(color: Colors.black),
          child: Column(
            children: [
              _buildInputField('Nombre', Icons.person, nameController),
              SizedBox(height: 15),
              _buildInputField('Edad', Icons.calendar_today, ageController, TextInputType.number),
              SizedBox(height: 15),
              _buildInputField('Ocupación', Icons.work, occupationController),
              SizedBox(height: 30),
              FloatingActionButton.extended(
                label: Text('Guardar y Ver Perfil', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  String name = nameController.text;
                  String age = ageController.text;
                  String occupation = occupationController.text;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        name: name,
                        age: age,
                        occupation: occupation,
                      ),
                    ),
                  );
                },
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, IconData icon, TextEditingController controller, [TextInputType inputType = TextInputType.text]) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon, color: Colors.black),
            border: InputBorder.none,
          ),
          keyboardType: inputType,
        ),
      ),
    );
  }
}
