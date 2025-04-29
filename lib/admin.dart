import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> saveToFirebase() async {
  String url = urlController.text.trim();
  String name = nameController.text.trim();
  String description = descriptionController.text.trim();

  print('Preparing to save: $url, $name, $description');

  if (url.isEmpty || name.isEmpty || description.isEmpty) {
    print('Validation failed: One or more fields empty');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please fill in all fields')),
    );
    return;
  }

  try {
    print('Calling Firebase add...');
    await FirebaseFirestore.instance.collection('adminData').add({
      'url': url,
      'name': name,
      'description': description,
    });
    print('Data saved successfully');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data saved successfully')),
    );
  } catch (e, stackTrace) {
    print('Failed to save data: $e');
    print('StackTrace: $stackTrace');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to save data')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Page')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                labelText: 'url',
                hintText: 'Enter url',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'name',
                hintText: 'Enter name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'description',
                hintText: 'Enter description',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:(){
                print('Save button pressed');
saveToFirebase();
              } ,
        

              child: Text('Save to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}