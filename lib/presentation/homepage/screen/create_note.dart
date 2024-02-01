import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:raionbattlepass/presentation/auth/screen/login_screen.dart';
import 'package:raionbattlepass/presentation/homepage/controller/create_note_controller.dart';
import 'package:raionbattlepass/route/routes.dart';

class CreateNoteScreen extends StatefulWidget {
  @override
  _CreateNoteScreenState createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  CreateNoteController controller = Get.put(CreateNoteController());

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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'title',
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'description',
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
                          controller.createNote(onSuccess: (msg) {
                            GoRouter.of(context).go(Routes.HOMEPAGE_SCREEN);
                            Get.find<CreateNoteController>().resetCreate();
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
                            'Create',
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
