import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TranslationsRecord extends FirestoreRecord {
  TranslationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "translated" field.
  List<String>? _translated;
  List<String> get translated => _translated ?? const [];
  bool hasTranslated() => _translated != null;

  // "input" field.
  List<String>? _input;
  List<String> get input => _input ?? const [];
  bool hasInput() => _input != null;

  void _initializeFields() {
    _translated = getDataList(snapshotData['translated']);
    _input = getDataList(snapshotData['input']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('translations');

  static Stream<TranslationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TranslationsRecord.fromSnapshot(s));

  static Future<TranslationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TranslationsRecord.fromSnapshot(s));

  static TranslationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TranslationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TranslationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TranslationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TranslationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TranslationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranslationsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TranslationsRecordDocumentEquality
    implements Equality<TranslationsRecord> {
  const TranslationsRecordDocumentEquality();

  @override
  bool equals(TranslationsRecord? e1, TranslationsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.translated, e2?.translated) &&
        listEquality.equals(e1?.input, e2?.input);
  }

  @override
  int hash(TranslationsRecord? e) =>
      const ListEquality().hash([e?.translated, e?.input]);

  @override
  bool isValidKey(Object? o) => o is TranslationsRecord;
}
