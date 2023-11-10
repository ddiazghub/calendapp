import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/components/user_data_form.dart';

class AppImagePicker extends StatelessWidget {
  AppImagePicker({super.key, this.defaultImage});

  final picker = Get.find<ImagePickController>();
  final String? defaultImage;

  Future<void> pickAvatar() async {
    picker.image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return FutureBuilder(
        future: picker.image?.readAsBytes() ?? Future.value(Uint8List(0)),
        builder: (context, snapshot) {
          return snapshotBuilder(context, snapshot, (context, bytes) {
            final image = switch ((bytes.isEmpty, defaultImage == null)) {
              (true, true) => null,
              (true, false) => NetworkImage(defaultImage!),
              (false, _) => MemoryImage(bytes),
            } as ImageProvider<Object>?;

            return Container(
              padding: const EdgeInsets.all(30),
              height: double.infinity,
              child: InkWell(
                onTap: pickAvatar,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                    image: image == null ? null : DecorationImage(image: image),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      minHeight: 30,
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: pickAvatar,
                        child: const Text(
                          style: TextStyle(color: Colors.white),
                          'Seleccionar avatar',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      );
    });
  }
}
