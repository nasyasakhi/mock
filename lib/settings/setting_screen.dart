import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/state-management/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account & Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
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
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildAccountOptions(),
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(width: 8),
                Text(
                  'App Settings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildAppSettings(themeProvider),
          ],
        ),
      ),
    );
  }

  // Updated _buildAppSettings to accept themeProvider for the dark theme toggle
  Column _buildAppSettings(ThemeProvider themeProvider) {
    return Column(
      children: [
        _buildSwitchTile('Enable Face ID For Log In', false),
        _buildSwitchTile('Enable Push Notifications', true),
        SwitchListTile(
          title: const Text('Dark Theme'),
          value: themeProvider.isDarkTheme,
          activeColor: primaryColor,
          inactiveTrackColor: Colors.transparent,
          onChanged: (bool value) {
            themeProvider.toggleTheme(value);
          },
        ),
      ],
    );
  }

  SwitchListTile _buildSwitchTile(String title, bool value) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      activeColor: primaryColor,
      inactiveTrackColor: Colors.transparent,
      onChanged: (bool newValue) {},
    );
  }

  Column _buildAccountOptions() {
    return Column(
      children: [
        _buildListTile(Icons.notifications_active_outlined, 'Notification Setting'),
        _buildListTile(Icons.shopping_cart_outlined, 'Shipping Address'),
        _buildListTile(Icons.payment_rounded, 'Payment Info'),
        _buildListTile(Icons.delete_outline_rounded, 'Delete Account'),
      ],
    );
  }

  ListTile _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
