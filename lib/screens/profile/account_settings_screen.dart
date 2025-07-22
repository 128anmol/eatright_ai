import 'package:flutter/material.dart';

class AccountSettingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit Profile'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('Change Password'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.red),
          title: Text('Logout', style: TextStyle(color: Colors.red)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.delete, color: Colors.red),
          title: Text('Delete Account', style: TextStyle(color: Colors.red)),
          onTap: () {},
        ),
      ],
    );
  }
} 