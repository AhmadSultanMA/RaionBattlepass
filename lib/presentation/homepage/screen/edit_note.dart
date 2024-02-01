import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:raionbattlepass/presentation/auth/screen/login_screen.dart';
import 'package:raionbattlepass/presentation/homepage/controller/edit_note_controller.dart';
import 'package:raionbattlepass/route/routes.dart';

class EditNoteScreen extends StatefulWidget {
  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  EditNoteController controller = Get.find<EditNoteController>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(controller.noteId),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
                ),
                child: TextFormField(
                  onChanged: (s) {
                    controller.title = s;
                  },
                  initialValue: controller.title,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
                ),
                child: TextFormField(
                  onChanged: (s) {
                    controller.description = s;
                  },
                  initialValue: controller.description,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Obx(() {
                return controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () {
                          controller.editNote(onSuccess: (msg) {
                            GoRouter.of(context).go(Routes.HOMEPAGE_SCREEN);
                            controller.resetEdit();
                            showMySnackbar(context, msg);
                          }, onFailed: (msg) {
                            showMySnackbar(context, msg);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(height * 0.02),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.all(Radius.circular(width * 0.03)),
                          ),
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
              }),
            ],
          ),
        ));
  }
}
