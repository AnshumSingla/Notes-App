import 'package:flutter/material.dart';
import 'notes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstPage(),
    );
  }
}

class firstPage extends StatefulWidget {
  firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  int count = 0;
  List<String> noteTitles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Notes',
          style: TextStyle(color: Color.fromRGBO(220, 220, 217, 1)),
        ),
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      ),
      backgroundColor: Color.fromRGBO(43, 42, 42, 1),
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.all(10.0), // Add padding around the grid
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      mainAxisSpacing: 10, // Spacing between rows
                      crossAxisSpacing: 10, // Spacing between columns
                      childAspectRatio: 1, // Aspect ratio of grid items
                    ),
                    itemCount: count,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          // Navigate to the notes page and get the updated title
                          final updatedTitle = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => notesPage(
                                noteTitle: noteTitles[index],
                              ),
                            ),
                          );

                          // Update the title of the selected note
                          if (updatedTitle != null) {
                            setState(() {
                              noteTitles[index] = updatedTitle;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(43, 42, 42, 1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 184, 184,
                                  184), // Set the border color here
                              width: 2.0, // Set the border width
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${noteTitles[index]}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    setState(() {
                      count += 1; // Increment the count to add more grid items
                      noteTitles.add(
                          'Untitled'); // Add a default title for the new note
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
