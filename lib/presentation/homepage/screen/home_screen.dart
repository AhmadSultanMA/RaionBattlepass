import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:raionbattlepass/presentation/auth/screen/login_screen.dart';
import 'package:raionbattlepass/presentation/homepage/controller/note_controller.dart';
import 'package:raionbattlepass/presentation/homepage/controller/user_controller.dart';
import 'package:raionbattlepass/route/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.put(UserController());
  NoteController noteController = Get.put(NoteController());

  @override
  void initState() {
    super.initState();
    fetchUser();
    fetchAllNotes();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchUser();
    fetchAllNotes();
  }

  Future<void> fetchUser() async {
    try {
      await userController.getUser(onSuccess: (value) {
        // print(value.id);
        // print(value.name);
        userController.nim.value = value.id;
        userController.name.value = value.name;
      }, onFailed: (msg) {
        showMySnackbar(context, msg);
      });
    } catch (error) {
      showMySnackbar(context, error.toString());
    }
  }

  Future<void> deleteNote(noteId) async {
    try {
      await noteController.deleteNote(noteId, onSuccess: (msg) {
        fetchAllNotes();
        showMySnackbar(context, msg);
      }, onFailed: (msg) {
        showMySnackbar(context, msg);
      });
    } catch (error) {
      showMySnackbar(context, error.toString());
    }
  }

  Future<void> fetchAllNotes() async {
    try {
      await noteController.getAllNotes(onSuccess: (value) {
        noteController.allNote.value = value;
      }, onFailed: (msg) {
        showMySnackbar(context, msg);
      });
    } catch (error) {
      showMySnackbar(context, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Obx(() {
                    return Column(
                      children: [
                        Text(userController.name.value),
                        Text(userController.nim.value),
                      ],
                    );
                  }),
                  Obx(() {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: noteController.allNote.length,
                        itemBuilder: (context, index) {
                          var note = noteController.allNote[index];
                          return Container(
                            margin: EdgeInsets.only(
                              bottom: height * 0.015,
                              right: 10,
                              left: 1,
                              top: index == 0 ? 10 : 0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1.2,
                                  offset: Offset(0, 0.2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(note.noteId),
                                Text(note.title),
                                Text(note.description),
                                GestureDetector(
                                    onTap: () {
                                      deleteNote(note.noteId);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue.shade600),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Text('Delete'),
                                    )),
                              ],
                            ),
                          );
                        });
                  }),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go(Routes.CREATENOTE_SCREEN);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade600),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text('Create Notes'),
                        )),
                  ),
                ],
              )),
        ));
  }
}
