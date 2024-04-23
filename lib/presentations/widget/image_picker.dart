import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File?) onImageSelected;
  final String descriptionText;

  const ImagePickerWidget({
    Key? key,
    required this.onImageSelected,
    required this.descriptionText,
  }) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _selectedImage;

  Future _pickImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
      widget.onImageSelected(_selectedImage);
    });
  }

  void _clearImage() {
    setState(() {
      _selectedImage = null;
      widget.onImageSelected(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_selectedImage == null) {
          _pickImage();
        } else {
          // You can add functionality to view the image in full screen, etc.
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: const Color.fromARGB(255, 136, 136, 136),
            width: 1.0,
          ),
        ),
        child: Stack(
          children: [
            _selectedImage == null
                ? Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 40,
                          color: Color.fromARGB(255, 136, 136, 136),
                        ),
                        Text(
                          widget.descriptionText,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(_selectedImage!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            
                            color: Color.fromARGB(255, 242, 242,
                                242), // Replace with your desired background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.1), // Adjust shadow color and opacity as needed
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 2), // Adjust the shadow offset
                              ),
                            ],
                          ),
                          child: InkWell(
                            child: Icon(
                              Icons.clear,
                              size: 18,
                              color: Colors.grey, // Adjust the icon color
                            ),
                            onTap: _clearImage,
                          ),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}