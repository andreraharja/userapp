import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create User'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Obx(() => TextFormField(
                            controller: controller.txtNama.value,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Nama *'),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harap mengisi Nama';
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() => TextFormField(
                            controller: controller.txtEmail.value,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email *',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harap mengisi Email';
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Obx(() => Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text('Gender')),
                              Text(': '),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 'male',
                                      groupValue: controller.flagGender.value,
                                      onChanged: (_) {
                                        controller.selectGender('male');
                                      },
                                    ),
                                    Text('Male'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 'female',
                                      groupValue: controller.flagGender.value,
                                      onChanged: (value) {
                                        controller.selectGender('female');
                                      },
                                    ),
                                    Text('Female'),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Obx(() => Row(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Text('Status')),
                              Text(': '),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 'active',
                                      groupValue: controller.flagStatus.value,
                                      onChanged: (_) {
                                        controller.selectStatus('active');
                                      },
                                    ),
                                    Text('Active'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Row(
                                  children: [
                                    Radio(
                                      value: 'inactive',
                                      groupValue: controller.flagStatus.value,
                                      onChanged: (value) {
                                        controller.selectStatus('inactive');
                                      },
                                    ),
                                    Text('Inactive'),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.buatPengguna();
                        }
                      },
                      child: Text('Buat Pengguna')))
            ],
          ),
        ),
      ),
    );
  }
}
