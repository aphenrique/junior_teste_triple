import 'dart:io';
import 'dart:developer';

class ConnectionVerifier {
  static Future<bool> isOnline() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected', name: 'Internet check');
      }
      return true;
    } on SocketException catch (_) {
      log('disconnected', name: 'Internet check');
      return false;
    } catch (e) {
      log('disconnected', name: 'Internet check', error: e);
      return false;
    }
  }
}
