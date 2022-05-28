import 'package:bot_toast/bot_toast.dart';
import 'package:cheraphy/base/auth.dart';
import 'package:cheraphy/models/calendar.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:cheraphy/view-models/calendar-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfessionalCalendarPage extends StatefulWidget {
  const ProfessionalCalendarPage({Key? key}) : super(key: key);

  @override
  _ProfessionalCalendarPageState createState() =>
      _ProfessionalCalendarPageState();
}

class _ProfessionalCalendarPageState extends State<ProfessionalCalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calendar"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController titleController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Add todo"),
                    content: Form(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Title:",
                          ),
                          controller: titleController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Description:",
                          ),
                          minLines: 3,
                          controller: descriptionController,
                          maxLines: 4,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                            onPressed: () async {
                              bool response =
                                  await Provider.of<CalendarViewModel>(context,
                                          listen: false)
                                      .addNewCalendar(
                                          Provider.of<AuthViewModel>(context,
                                                  listen: false)
                                              .user!
                                              .id!,
                                          Calendars(
                                              professionalId:
                                                  Provider.of<AuthViewModel>(
                                                          context,
                                                          listen: false)
                                                      .user!
                                                      .id!,
                                              description:
                                                  descriptionController.text,
                                              title: titleController.text));
                              if (response == true) {
                                BotToast.showText(text: "Todo added");
                                Navigator.pop(context);
                                Navigator.pop(context);
                              } else {
                                BotToast.showText(text: "Todo could not added");
                              }
                            },
                            child: Text("Add"))
                      ],
                    )),
                  ));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: getCalendar(),
          builder: (context, snapshot) {
            List<Calendars> calendars =
                Provider.of<CalendarViewModel>(context, listen: true).calendars;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: calendars.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: ValueKey(calendars[index].id!.toString()),
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (context) async {
                              bool response =
                                  await Provider.of<CalendarViewModel>(context,
                                          listen: false)
                                      .deleteCalendarById(calendars[index].id!);
                              if (response) {
                                BotToast.showText(text: "Todo deleted");
                                Navigator.pop(context);
                              } else {
                                BotToast.showText(
                                    text: "Todo could not deleted");
                              }
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              TextEditingController titleController =
                                  TextEditingController(
                                      text: calendars[index].title);
                              TextEditingController descriptionController =
                                  TextEditingController(
                                      text: calendars[index].description);
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                      title: Text("Edit content"),
                                      content: Form(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: "Title:",
                                            ),
                                            controller: titleController,
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your password';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: "Description:",
                                            ),
                                            minLines: 3,
                                            controller: descriptionController,
                                            maxLines: 4,
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your password';
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(height: 16),
                                          ElevatedButton(
                                              onPressed: () async {
                                                print(calendars[index].id!);
                                                bool response = await Provider
                                                        .of<CalendarViewModel>(
                                                            context,
                                                            listen: false)
                                                    .updateCalendar(
                                                        calendars[index].id!,
                                                        Calendars(
                                                            title:
                                                                titleController
                                                                    .text,
                                                            description:
                                                                descriptionController
                                                                    .text));
                                                if (response == true) {
                                                  BotToast.showText(
                                                      text: "Todo updated");
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                } else {
                                                  BotToast.showText(
                                                      text:
                                                          "Todo could not updated");
                                                }
                                              },
                                              child: Text("Update"))
                                        ],
                                      ))));
                            },
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ],
                      ),

                      // The end action pane is the one at the right or the bottom side.

                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            leading: const Icon(Icons.article),
                            title: Text(calendars[index].title ?? "No title"),
                            subtitle: Text(
                                calendars[index].description ?? "No content"),
                            trailing: Text(DateFormat.yMMMEd().format(
                                DateTime.parse(calendars[index].createdAt!))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider()
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: ErrorWidget(snapshot.error!),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  getCalendar() async {
    await Provider.of<CalendarViewModel>(context, listen: false)
        .getAllCalendarsByProfessionalId(
            Provider.of<AuthViewModel>(context, listen: false).user!.id!);

    return true;
  }
}
