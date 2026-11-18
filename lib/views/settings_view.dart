import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/user_settings.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() {
    return _SettingsViewState();
  }
}

class _SettingsViewState extends State<SettingsView> {
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  late TextEditingController _patronNumberController;

  bool _receiveNewsByEmail = true;
  String _confirmationMessage = '';

  void _saveSettings() {
    final String patronNumber = _patronNumberController.text.trim();
    final String address = _addressController.text.trim();
    final String email = _emailController.text.trim();

    final UserSettings settings = UserSettings(
      patronNumber: patronNumber,
      address: address,
      email: email,
      recieveNewsByEmail: _receiveNewsByEmail,
    );

    setState(() {
      _confirmationMessage = 'Settings saved for ${settings.email}';
    });
  }

  @override
  void initState() {
    super.initState();
    _patronNumberController = TextEditingController();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _patronNumberController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'My Settings',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Address',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: cinemaFontMuted),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _addressController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your address',
                  hintText: 'Enter your address',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Email Address',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: cinemaFontMuted),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email address',
                  hintText: 'Enter your email address',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Patron Number',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: cinemaFontMuted),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _patronNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Patron Number',
                  hintText: 'Enter your patron number',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Preferences',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: cinemaFontMuted),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Expanded(
                    child: Text('Receive news by email'),
                  ),
                  Switch(
                    value: _receiveNewsByEmail,
                    onChanged: (bool value) {
                      setState(() {
                        _receiveNewsByEmail = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                label: 'SAVE SETTINGS',
                onPressed: _saveSettings,
              ),
            ),
            if (_confirmationMessage.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                _confirmationMessage,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
            ])));
  }
}
