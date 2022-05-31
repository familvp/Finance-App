// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:paynav_for_all/localdatabase/sessionManager.dart';

import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:paynav_for_all/routes.dart';
import 'package:paynav_for_all/screens/home/blocs/weekDatesBloc/weekdate_bloc.dart';
import 'package:paynav_for_all/screens/home/homeScreen.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/enterPayNavScreen.dart';

import 'firebase_options.dart';

const channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// function to handle the local notification
// when the app is running in the backgorund
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  flutterLocalNotificationsPlugin.show(
    message.data.hashCode,
    "Buddy Alert from PayNav",
    "${message.data['notification']}",
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        icon: 'launch_background',
        priority: Priority.high,
      ),
    ),
  );
}

// Main functuion that runs the whole app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    PayNavApp(),
  );
}

class PayNavApp extends StatefulWidget {
  const PayNavApp({Key? key}) : super(key: key);

  @override
  _PayNavAppState createState() => _PayNavAppState();
}

class _PayNavAppState extends State<PayNavApp> {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  SessionManager _sessionManager = SessionManager();
  final User? _user = FirebaseAuth.instance.currentUser;
  // final SpDbHelper _spDbHelper = SpDbHelper();

  requestPermissions() async {
    print(_messaging.getNotificationSettings());
    NotificationSettings settings = await _messaging.requestPermission();
    print(settings.authorizationStatus);
  }

  updateToken() async {
    final String? token = await _messaging.getToken();
    // final String? storedFcmToken = _spDbHelper.getStoredFcmToken();

    // if (storedFcmToken != token) {
    //   final FirebaseDatabase _db = FirebaseDatabase.instance;
    // final String? pnId = _spDbHelper.getUserPnId();
    // _spDbHelper.setFcmToken(token!);
    // print('updating');
    // final DatabaseReference ref =
    //     _db.reference().child('Thor/TokenData/$pnId');
    //   // ref.set(token);
    // }
  }

  @override
  void initState() {
    // ignore: avoid_print
    _sessionManager.init().then((value) => print(" hhhh ${_sessionManager.getUserPnId()}"));
    // print();
    requestPermissions();
    // _spDbHelper.init().then((value) => updateToken());

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          "notification.title",
          "notification.body",
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'launch_background',
              priority: Priority.high,
            ),
          ),
        );
      } else {
        flutterLocalNotificationsPlugin.show(
          message.data.hashCode,
          "Buddy Alert from PayNav",
          "${message.data['notification']}",
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'launch_background',
              priority: Priority.high,
            ),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routeLinks,
      title: 'PayNav',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: resources.yellowColor,
        ),
        sliderTheme: SliderThemeData(
          rangeThumbShape: RoundRangeSliderThumbShape(),
          trackHeight: 2.0,
          activeTrackColor: resources.whiteColor,
          inactiveTrackColor: resources.white20Color,
          thumbColor: resources.yellowColor,
        ),
        textTheme: Typography(platform: TargetPlatform.android).white,
        highlightColor: resources.blackBlueColor,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: resources.customDarkBlueColor)
                .copyWith(secondary: resources.yellowColor),
      ),
    );
  }
}





/*

  {
  "amount": 600,
  "comment": "string",
  "expensePaidBy": [
    {
      "groupId": [
        "G1835250846561"
      ],
      "share": 600,
      "userId": "PN3637492980758"
    }
  ],
  "expenseSplitUser": [
    {
      "groupId": [
        "G1835250846561"
      ],
      "share": 300,
      "userId": "PN3637492980758"
    },
    {
      "deadLine": "2021-12-06",
      "groupId": [
        "G1835250846561"
      ],
      "share": 300,
      "userId": "PN6046744784048"
    }
  ]
}
  */
