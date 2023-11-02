import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/pages/sign_up_page.dart';

class AppImagePicker extends StatelessWidget {
  AppImagePicker({super.key});

  final picker = Get.find<ImagePickController>();

  Future<void> pickAvatar() async {
    print('Before ${picker.image}');
    picker.image = await ImagePicker().pickImage(source: ImageSource.gallery);
    print('After ${picker.image}');
  }

  @override
  Widget build(BuildContext context) {
    const InputDecoration(
      labelText: 'Image picker',
      border: OutlineInputBorder(),
      helperText: '',
    );

    return Obx(() {
      return FutureBuilder(
        future: picker.image?.readAsBytes() ?? Future.value(Uint8List(0)),
        builder: (context, snapshot) {
          return snapshotBuilder(context, snapshot, (context, bytes) {
            return Container(
              padding: const EdgeInsets.all(30),
              height: double.infinity,
              child: InkWell(
                onTap: pickAvatar,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                    image: bytes.isEmpty
                        ? null
                        : DecorationImage(image: MemoryImage(bytes)),
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
                        child: const Text('Pick Avatar'),
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
