import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paynav_for_all/localdatabase/sessionManager.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Widget logoutTile = _buildButton(
      resources.logoutIcon,
      'Logout',
      showConfirmationDialog,
    );

    final Widget supportTile = _buildButton(
      resources.supportIcon,
      'Support',
      () {
        // UrlUtils.openUrl(url: resources.whatsappInviteURl);
      },
    );

    final Widget termAndServiceTile = _buildButton(
      resources.termsOfServiceIcon,
      'Terms of service',
      () {
        // UrlUtils.openUrl(url: resources.termsOfServiceUrl);
      },
    );

    final Widget privacyPolicyTile = _buildButton(
      resources.privacyPolicyIcon,
      'Privacy Policy',
      () {
        // UrlUtils.openUrl(url: resources.privacyPolicyUrl);
      },
    );

    return Scaffold(
      backgroundColor: resources.whiteColor,
      appBar: AppBar(
        backgroundColor: resources.darkBlue,
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            supportTile,
            termAndServiceTile,
            privacyPolicyTile,
            logoutTile,
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    String iconPath,
    String buttonPurpose,
    void Function()? buttonFunction,
  ) {
    final Widget buttonIcon = ImageIcon(
      AssetImage(iconPath),
      color: resources.blackBlueColor,
    );

    final Widget buttonLabel = Text(
      buttonPurpose,
      style: const TextStyle(
        fontSize: 18,
        color: resources.blackBlueColor,
        fontWeight: FontWeight.w600,
      ),
    );

    return ListTile(
      leading: buttonIcon,
      title: buttonLabel,
      isThreeLine: false,
      onTap: buttonFunction,
      horizontalTitleGap: 5,
    );
  }

  showConfirmationDialog() {
    final Widget yesButton = TextButton(
      onPressed: logoutAndNavigate,
      child: const Text("Yes"),
    );
    final Widget nobutton = TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text("No"),
    );

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: resources.whiteColor,
          content: const Text(
            "Are you sure you want to log-out.??",
            style: TextStyle(
              color: resources.blackBlueColor,
            ),
          ),
          actions: [
            yesButton,
            nobutton,
          ],
        );
      },
    );
  }

  logoutAndNavigate() async {
    Navigator.of(context).pop();
    await _auth.signOut();
    SessionManager _sessionManager = SessionManager();
    _sessionManager.clearSession();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully Logged Out...!!'),
      ),
    );

    print('Successfully Logged Out...!!');
  }
}
