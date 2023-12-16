import 'package:firebase_remote_config/firebase_remote_config.dart';

Future initializeFirebaseRemoteConfig() async {
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await FirebaseRemoteConfig.instance.setDefaults(const {
    'appName': 'Skill Master Institute',
    'Website': 'https://skillmasterinstitute.com/',
    'WhatsApp':
        'https://api.whatsapp.com/send?phone=918570068288&text=Hi%2C%20Sir%0ANeed%20Help',
    'Franchise_Code': '0',
  });
  await FirebaseRemoteConfig.instance.fetchAndActivate();
}

String getRemoteConfigString(String key) =>
    FirebaseRemoteConfig.instance.getString(key);

bool getRemoteConfigBool(String key) =>
    FirebaseRemoteConfig.instance.getBool(key);

int getRemoteConfigInt(String key) => FirebaseRemoteConfig.instance.getInt(key);

double getRemoteConfigDouble(String key) =>
    FirebaseRemoteConfig.instance.getDouble(key);
