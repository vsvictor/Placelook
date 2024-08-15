import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends StatefulWidget {
  final Widget backgroundImage;
  final double radius;
  final Color colorBask;
  final XFile? img = null;
  const Avatar(
      {super.key,
      required this.backgroundImage,
      required this.radius,
      required this.colorBask});
  @override
  _AvatarState createState() =>
      _AvatarState(backgroundImage, radius, colorBask);
}

class _AvatarState extends State<Avatar> {
  File? _imgFile;
  Widget backgroundImage;
  double radius;
  Color colorBask;
  _AvatarState(this.backgroundImage, this.radius, this.colorBask);
  void takeSnapshot() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.camera, // alternatively, use ImageSource.gallery
      maxWidth: 2 * radius,
    );
    if (img == null) return;
    setState(() {
      _imgFile = File(img.path); // convert it to a Dart:io file
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: colorBask,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          child: ClipOval(
            child: Container(
                padding: EdgeInsets.all(radius / 5),
                width: radius,
                height: radius,
                child: _imgFile != null
                    ? Image.file(_imgFile!, width: radius, height: radius)
                    : backgroundImage),
          ),
          onTap: () {
            takeSnapshot();
          },
        ));
  }
}
