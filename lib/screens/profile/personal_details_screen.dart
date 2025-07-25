import 'package:flutter/material.dart';
import 'account_settings_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Details', style: GoogleFonts.poppins())),
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
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: GoogleFonts.openSans(),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.openSans(),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.openSans(),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.openSans(),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone (optional)',
                  labelStyle: GoogleFonts.openSans(),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.openSans(),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: GoogleFonts.openSans(),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: ['Male', 'Female', 'Other']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g, style: GoogleFonts.openSans())))
                    .toList(),
                onChanged: (val) {},
                style: GoogleFonts.openSans(),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle: GoogleFonts.openSans(),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.openSans(),
                onTap: () {}, // TODO: Show date picker
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Height (cm)',
                  labelStyle: GoogleFonts.openSans(),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.openSans(),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                  labelStyle: GoogleFonts.openSans(),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.openSans(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                child: Text('Save', style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D8C8C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                  elevation: 8,
                ),
              ),
              const SizedBox(height: 24),
              AccountSettingsSection(),
            ],
          ),
        ),
      ),
    );
  }
} 