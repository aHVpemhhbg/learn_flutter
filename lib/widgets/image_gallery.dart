import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImageGallery extends StatefulWidget {
  final List<Uint8List> imageFileBytes;

  const ImageGallery({super.key, required this.imageFileBytes});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 0, maxHeight: 200),
          child: Row(
            children: [
              for (var img in widget.imageFileBytes)
                Row(
                  children: [Image.memory(img), const SizedBox(width: 16)],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
