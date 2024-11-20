import 'package:flutter/material.dart';

class notesPage extends StatelessWidget {
  final String noteTitle;
  const notesPage({Key? key, required this.noteTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: noteTitle);
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          '${noteTitle}',
          style: TextStyle(color: Color.fromRGBO(220, 220, 217, 1)),
        ),
        backgroundColor: Color.fromRGBO(43, 42, 42, 1),
        iconTheme: const IconThemeData(
          color:
              Colors.white, // Set the color of the back button or leading icon
        ),
      ),
      backgroundColor: Color.fromRGBO(43, 42, 42, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                color: Colors.white, // Change the color of the entered text
              ),
              controller: titleController,
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              style: const TextStyle(
                color: Colors.white, // Change the color of the entered text
              ),
              controller: textController,
              maxLines: 8,
              decoration: const InputDecoration(
                labelText: 'Text',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, titleController.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
