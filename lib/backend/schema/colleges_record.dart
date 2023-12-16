import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CollegesRecord extends FirestoreRecord {
  CollegesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "NSTI" field.
  String? _nsti;
  String get nsti => _nsti ?? '';
  bool hasNsti() => _nsti != null;

  void _initializeFields() {
    _nsti = snapshotData['NSTI'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Colleges');

  static Stream<CollegesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollegesRecord.fromSnapshot(s));

  static Future<CollegesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CollegesRecord.fromSnapshot(s));

  static CollegesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollegesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollegesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollegesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollegesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollegesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollegesRecordData({
  String? nsti,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NSTI': nsti,
    }.withoutNulls,
  );

  return firestoreData;
}

class CollegesRecordDocumentEquality implements Equality<CollegesRecord> {
  const CollegesRecordDocumentEquality();

  @override
  bool equals(CollegesRecord? e1, CollegesRecord? e2) {
    return e1?.nsti == e2?.nsti;
  }

  @override
  int hash(CollegesRecord? e) => const ListEquality().hash([e?.nsti]);

  @override
  bool isValidKey(Object? o) => o is CollegesRecord;
}
