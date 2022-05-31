import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String userAvatarUrlKey = "userAvatarKey";
  final String userPayNavIdKey = "userPayNavId";
  final String allTransactionHashedString = "hashedString";
  final String notificationHashKey = "NotificationoHashKey";
  final String fcmTokenKey = 'fcmTokenKey';

  static late SharedPreferences _sp;
  static SessionManager? _instance;
  SessionManager._internal();

  factory SessionManager() {
    return _instance ?? SessionManager._internal();
  }

  Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  Future setHashedString(String newHashedString) {
    return _sp.setString(allTransactionHashedString, newHashedString);
  }

  Future setAvatarUrl(String avatarUrl) {
    return _sp.setString(userAvatarUrlKey, avatarUrl);
  }

  Future setNotificationHashedString(String newHashedSTring) {
    return _sp.setString(notificationHashKey, newHashedSTring);
  }

  Future setUserPNId(String userPNId) {
    return _sp.setString(userPayNavIdKey, userPNId);
  }

  Future setFcmToken(String token) {
    return _sp.setString(fcmTokenKey, token);
  }

  String? getUserAvatarUrl() {
    final String? userAvatarUrl = _sp.getString(userAvatarUrlKey);
    return userAvatarUrl;
  }

  String? getUserPnId() {
    final String? userPnId = _sp.getString(userPayNavIdKey);
    return userPnId;
  }

  String? getHashedString() {
    final String? hashedString = _sp.getString(allTransactionHashedString);
    return hashedString;
  }

  String? getNotificationHashedString() {
    final String? hashedString = _sp.getString(notificationHashKey);
    return hashedString;
  }

  String? getStoredFcmToken() {
    final String? fcmToken = _sp.getString(fcmTokenKey);
    return fcmToken;
  }

  void clearSession() {
    _sp.clear();
  }
}
