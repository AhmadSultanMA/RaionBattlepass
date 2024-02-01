import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:raionbattlepass/presentation/auth/screen/login_screen.dart';
import 'package:raionbattlepass/presentation/homepage/controller/edit_user_controller.dart';
import 'package:raionbattlepass/route/routes.dart';

class EditUserScreen extends StatefulWidget {
  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  EditUserController controller = Get.put(EditUserController());
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
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: height * 0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
                ),
                child: TextFormField(
                  onChanged: (s) {
                    controller.name = s;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Name',
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
                margin: EdgeInsets.only(top: height * 0.02),
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
                ),
                child: TextFormField(
                  onChanged: (s) {
                    controller.password = s;
                  },
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey.shade600,
                      ),
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
                margin: EdgeInsets.only(top: height * 0.02),
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
                    hintText: 'Description',
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
                          if (controller.name == "") {
                            showMySnackbar(context, 'isi name');
                          } else if (controller.password == "") {
                            showMySnackbar(context, 'isi password');
                          } else if (controller.description == "") {
                            showMySnackbar(context, 'isi description');
                          } else {
                            controller.editUser(onSuccess: (msg) {
                              GoRouter.of(context).go(Routes.HOMEPAGE_SCREEN);
                              showMySnackbar(context, msg);
                            }, onFailed: (msg) {
                              showMySnackbar(context, msg);
                            });
                          }
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
