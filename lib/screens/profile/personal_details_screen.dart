import 'package:flutter/material.dart';
import 'account_settings_screen.dart';

class PersonalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Details')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'Phone (optional)')),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Gender'),
              items: ['Male', 'Female', 'Other']
                  .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                  .toList(),
              onChanged: (val) {},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Date of Birth'),
              onTap: () {}, // TODO: Show date picker
            ),
            TextField(decoration: InputDecoration(labelText: 'Height (cm)')),
            TextField(decoration: InputDecoration(labelText: 'Weight (kg)')),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
            SizedBox(height: 24),
            AccountSettingsSection(),
          ],
        ),
      ),
    );
  }
} 