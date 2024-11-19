import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    required this.isDarkTheme,
    required this.onThemeChanged,
  });

  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account & Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black
              ),
              ),
            const SizedBox(height: 10),
            _buildAccountOptions(), // extract method
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(width: 8),
                Text(
                  'App Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            _buildAppSettings(),
          ],
        ),
      ),
    );
  }

  Column _buildAppSettings() {
    return Column(
      children: [
        _buildSwitchTile('Enable Face ID For Log In', false),
        _buildSwitchTile('Enable Push Notifications', true),
        _buildSwitchTile('Enable Location Services', true),
        SwitchListTile(
          title: const Text('Dark Theme'),
          value: isDarkTheme,
          activeColor: Colors.blue, // Set your desired active color
          inactiveTrackColor: Colors.transparent, // Set your desired inactive color
          onChanged: onThemeChanged,
        ),
      ],
    );
  }

  SwitchListTile _buildSwitchTile(String title, bool value) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        activeColor: Colors.blue, // Set your desired active color
        inactiveTrackColor: Colors.transparent, // Set your desired inactive color
        onChanged: (bool newValue) {},
      );
  }

  Column _buildAccountOptions() {
    return Column(
      children: [
        _buildListTile(Icons.notifications_active_outlined,'Notification Setting'),
        _buildListTile(Icons.shopping_cart_outlined,'Shipping Address'),
        _buildListTile(Icons.payment_rounded,'Payment Info'),
        _buildListTile(Icons.delete_outline_rounded,'Delete Account'),
      ],
    );
  }

  ListTile _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(
      icon,
      size: 24, // Ubah ukuran ikon di sini
    ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Row _buildSectionTitle(IconData icon, String title) { // remove
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: isDarkTheme ? Colors.white : textColor,
          ),
        ),
      ],
    );
  }
}
