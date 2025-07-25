import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final File? imageFile;
  final String foodName;
  final Map<String, String> nutrition;
  final String verdict;
  final String tip;

  const ResultScreen({
    Key? key,
    this.imageFile,
    this.foodName = "Chicken Curry",
    this.nutrition = const {
      "Calories": "320 kcal",
      "Protein": "25g",
      "Fat": "18g",
      "Carbs": "12g",
      "Cholesterol": "80mg",
    },
    this.verdict = "High in protein, moderate in fat. Enjoy in moderation!",
    this.tip = "Pair with salad for a balanced meal.",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Analysis', style: GoogleFonts.poppins())),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2D8C8C), Color(0xFFFFA726)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(imageFile!, height: 180),
                    )
                  : Icon(Icons.fastfood, size: 100, color: Colors.grey),
              const SizedBox(height: 24),
              Text(
                foodName,
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2D8C8C)),
              ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: nutrition.entries
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(e.key, style: GoogleFonts.openSans(fontWeight: FontWeight.w600)),
                                Text(e.value, style: GoogleFonts.openSans()),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                verdict,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                tip,
                style: GoogleFonts.openSans(fontSize: 15, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ElevatedButton.icon(
                icon: Icon(Icons.save),
                label: Text('Save to History', style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2D8C8C),
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  textStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // TODO: Save to history or show a message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Saved to history!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} 