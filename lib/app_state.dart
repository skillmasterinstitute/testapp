import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _AuthorizedUser = (await secureStorage.getStringList('ff_AuthorizedUser'))
              ?.map((path) => path.ref)
              .toList() ??
          _AuthorizedUser;
    });
    await _safeInitAsync(() async {
      _AppName = await secureStorage.getString('ff_AppName') ?? _AppName;
    });
    await _safeInitAsync(() async {
      _Content = await secureStorage.getStringList('ff_Content') ?? _Content;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<DocumentReference> _AuthorizedUser = [
    FirebaseFirestore.instance.doc('/user/g7lagItKCYeVs8OHSMeGu1PNnRJ3'),
    FirebaseFirestore.instance.doc('/user/PJJeOJKGUhbkhwGg3UIlK7B9xic2'),
    FirebaseFirestore.instance.doc('/user/lkVW3eh9lPMBRwiH6BF2U1NJ14Z2')
  ];
  List<DocumentReference> get AuthorizedUser => _AuthorizedUser;
  set AuthorizedUser(List<DocumentReference> value) {
    _AuthorizedUser = value;
    secureStorage.setStringList(
        'ff_AuthorizedUser', value.map((x) => x.path).toList());
  }

  void deleteAuthorizedUser() {
    secureStorage.delete(key: 'ff_AuthorizedUser');
  }

  void addToAuthorizedUser(DocumentReference value) {
    _AuthorizedUser.add(value);
    secureStorage.setStringList(
        'ff_AuthorizedUser', _AuthorizedUser.map((x) => x.path).toList());
  }

  void removeFromAuthorizedUser(DocumentReference value) {
    _AuthorizedUser.remove(value);
    secureStorage.setStringList(
        'ff_AuthorizedUser', _AuthorizedUser.map((x) => x.path).toList());
  }

  void removeAtIndexFromAuthorizedUser(int index) {
    _AuthorizedUser.removeAt(index);
    secureStorage.setStringList(
        'ff_AuthorizedUser', _AuthorizedUser.map((x) => x.path).toList());
  }

  void updateAuthorizedUserAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _AuthorizedUser[index] = updateFn(_AuthorizedUser[index]);
    secureStorage.setStringList(
        'ff_AuthorizedUser', _AuthorizedUser.map((x) => x.path).toList());
  }

  void insertAtIndexInAuthorizedUser(int index, DocumentReference value) {
    _AuthorizedUser.insert(index, value);
    secureStorage.setStringList(
        'ff_AuthorizedUser', _AuthorizedUser.map((x) => x.path).toList());
  }

  String _AppName = 'CITS Exam Preparation';
  String get AppName => _AppName;
  set AppName(String value) {
    _AppName = value;
    secureStorage.setString('ff_AppName', value);
  }

  void deleteAppName() {
    secureStorage.delete(key: 'ff_AppName');
  }

  List<String> _Content = [
    'Lesson Plan',
    'Demo Plan',
    'E-Book',
    'Notes',
    'Video'
  ];
  List<String> get Content => _Content;
  set Content(List<String> value) {
    _Content = value;
    secureStorage.setStringList('ff_Content', value);
  }

  void deleteContent() {
    secureStorage.delete(key: 'ff_Content');
  }

  void addToContent(String value) {
    _Content.add(value);
    secureStorage.setStringList('ff_Content', _Content);
  }

  void removeFromContent(String value) {
    _Content.remove(value);
    secureStorage.setStringList('ff_Content', _Content);
  }

  void removeAtIndexFromContent(int index) {
    _Content.removeAt(index);
    secureStorage.setStringList('ff_Content', _Content);
  }

  void updateContentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Content[index] = updateFn(_Content[index]);
    secureStorage.setStringList('ff_Content', _Content);
  }

  void insertAtIndexInContent(int index, String value) {
    _Content.insert(index, value);
    secureStorage.setStringList('ff_Content', _Content);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
