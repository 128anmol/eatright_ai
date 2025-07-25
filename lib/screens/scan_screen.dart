import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'result_screen.dart';

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(imageFile: File(pickedFile.path)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan Food')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile != null
                ? Image.file(_imageFile!, height: 220)
                : Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.fastfood, size: 80, color: Colors.grey),
                  ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text('Scan with Camera'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2D8C8C),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text('Upload from Gallery'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFA726),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
} 