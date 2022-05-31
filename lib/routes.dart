import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynav_for_all/screens/home/blocs/pageview_height/pageview_height_cubit.dart';
import 'package:paynav_for_all/screens/home/blocs/weekDatesBloc/weekdate_bloc.dart';
import 'package:paynav_for_all/screens/home/homeScreen.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/blocs_&_cubits/login_bloc/login_bloc.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/blocs_&_cubits/select_one/selectone_bloc.dart';
// import 'package:paynav_for_all/screens/GroupScreens/newGroupScreen.dart';
// import 'package:paynav_for_all/screens/home.dart';
// import 'package:paynav_for_all/screens/notificationScreen.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/conitnueScreen.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/enterName.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/enterPayNavScreen.dart';
// import 'package:paynav_for_all/screens/onBoardingScreens/introductionScreens/does1.dart';
// import 'package:paynav_for_all/screens/onBoardingScreens/introductionScreens/does2.dart';
// import 'package:paynav_for_all/screens/onBoardingScreens/introductionScreens/does3.dart';
// import 'package:paynav_for_all/screens/onBoardingScreens/introductionScreens/does4.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/logInScreen.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/permisssions.dart';
import 'package:paynav_for_all/screens/onBoardingScreens/welcomeScreen.dart';
import 'package:paynav_for_all/screens/settings/setting_screen.dart';
import 'package:paynav_for_all/screens/social/repeat_bills.dart';
import 'package:paynav_for_all/screens/social/social.dart';
// import 'package:paynav_for_all/screens/searchScreen.dart';
// import 'package:paynav_for_all/screens/settingsScreen.dart';
// import 'package:paynav_for_all/screens/transactionDetails/Screens/TransactionDetailScreen.dart';
// import './screens/dashBoardScreen.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

Map<String, Widget Function(BuildContext)> routeLinks = {
  // "/dashboard": (_) => DashBoardScreen(),
  // "/messages": (_) => GroupsDashboard(),
  "/settings": (_) => const SettingsScreen(),
  // "/notifications": (_) => NotificationScreen(),
  "/": (_) => _auth.currentUser == null
      ? EnterPayNavScreen()
      : MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => WeekdateBloc()),
            BlocProvider(create: (_) => PageviewHeightCubit()),
          ],
          child: const HomeScreen(),
        ),
  // "/searchScreen": (_) => SearchScreen(),
  "/loginScreen": (_) => BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginScreen(),
      ),
  "/enterPayNavScreen": (_) => EnterPayNavScreen(),
  "/enterNameScreen": (_) => BlocProvider(
        create: (context) => LoginBloc(),
        child: const EnterNameScreen(),
      ),
  // "/dos1": (_) => Does1Screen(),
  // "/dos2": (_) => Does2Screen(),
  // "/dos3": (_) => Does3Screen(),
  // "/dos4": (_) => Does4Screen(),
  // "transactionDetailScreen": (_) => TransactionDetailScreen(),
  "/permissionAcess": (_) => PermissionAcess(),
  "/welcomeScreen": (_) => WelcomeScreen(),
  "/continue": (_) => BlocProvider(
        create: (context) => SelectoneBloc(),
        child: const ContinueScreen(),
      ),
  "/repeatBills": (_) => const RepeatBills(),
  
};
