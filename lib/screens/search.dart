import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_repository_using_getx/controller/notes_controller.dart';
import 'package:student_repository_using_getx/screens/profile.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final studenController = Get.find<NotesController>();
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListView.builder(
          itemBuilder: (context, index) {
            final data = studenController.students[index];
            if (data.name.toLowerCase().contains(query.toLowerCase().trim())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return ProfileScreen(
                          index: index,
                        );
                      }));
                    },
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: FileImage(
                        File(data.profile),
                      ),
                    ),
                    title:
                        Text(data.name, style: const TextStyle(fontSize: 20)),
                  ),
                  const Divider()
                ],
              );
            } else {
              return const Text('');
            }
          },
          itemCount: studenController.students.length),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final studentController = Get.find<NotesController>();

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListView.builder(
          itemBuilder: (context, index) {
            final data = studentController.students[index];
            if (data.name.toLowerCase().contains(query.toLowerCase().trim())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return ProfileScreen(
                          index: index,
                        );
                      }));
                    },
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: FileImage(
                        File(data.profile),
                      ),
                    ),
                    title:
                        Text(data.name, style: const TextStyle(fontSize: 20)),
                  ),
                  const Divider()
                ],
              );
            }
            return null;
          },
          itemCount: studentController.students.length),
    );
  }
}
