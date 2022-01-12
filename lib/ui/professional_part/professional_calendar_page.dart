import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProfessionalCalendarPage extends StatefulWidget {
  const ProfessionalCalendarPage({Key? key}) : super(key: key);

  @override
  _ProfessionalCalendarPageState createState() =>
      _ProfessionalCalendarPageState();
}

class _ProfessionalCalendarPageState extends State<ProfessionalCalendarPage> {
  List<Map<String, dynamic>> todos = [
    {
      "id": 0,
      "title": "Meeting with Mrs. Smith",
      "content": "Don't forget to prepare that work",
      "date": "Jan 26 15:30"
    },
    {
      "id": 1,
      "title": "Meeting with Mrs. Smith",
      "content": "Don't forget to prepare that work",
      "date": "Jan 27 15:30"
    },
    {
      "id": 2,
      "title": "Meeting with Mrs. Smith",
      "content": "Don't forget to prepare that work",
      "date": "Jan 28 15:30"
    },
    {
      "id": 3,
      "title": "Meeting with Mrs. Smith",
      "content": "Don't forget to prepare that work",
      "date": "Jan 29 15:30"
    },
    {
      "id": 4,
      "title": "Meeting with Mrs. Smith",
      "content": "Don't forget to prepare that work",
      "date": "Jan 30 15:30"
    },
    {
      "id": 5,
      "title": "Meeting with Mrs. Smith",
      "content": "Don't forget to prepare that work",
      "date": "Jan 30 17:30"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Calendar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO Add CONTENT
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Slidable(
              key: ValueKey(todos[index]["id"]!.toString()),
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      //TODO EDİT CONTENT
                    },
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.

              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    leading: Icon(Icons.article),
                    title: Text(todos[index]["title"]),
                    subtitle: Text(todos[index]["content"]),
                    trailing: Text(todos[index]["date"]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider()
                ],
              ),
            );
          }),
    );
  }
}
