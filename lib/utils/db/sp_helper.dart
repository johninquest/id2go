import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  Future<void> storeInSharedPrefs(String dataKey, String dataValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(dataKey, dataValue);
  }

  Future<String?> retrieveFromSharedPrefs(String dataKey) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(dataKey);
    return jsonString;
    /* if (jsonString != null) {
    return jsonDecode(jsonString);
  } else {
    // Handle the case where no data is stored under the key
    return {};
  } */
  }
}
