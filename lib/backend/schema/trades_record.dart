import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TradesRecord extends FirestoreRecord {
  TradesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TRADES" field.
  String? _trades;
  String get trades => _trades ?? '';
  bool hasTrades() => _trades != null;

  // "SUBJECT" field.
  int? _subject;
  int get subject => _subject ?? 0;
  bool hasSubject() => _subject != null;

  void _initializeFields() {
    _trades = snapshotData['TRADES'] as String?;
    _subject = castToType<int>(snapshotData['SUBJECT']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Trades');

  static Stream<TradesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TradesRecord.fromSnapshot(s));

  static Future<TradesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TradesRecord.fromSnapshot(s));

  static TradesRecord fromSnapshot(DocumentSnapshot snapshot) => TradesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TradesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TradesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TradesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TradesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTradesRecordData({
  String? trades,
  int? subject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TRADES': trades,
      'SUBJECT': subject,
    }.withoutNulls,
  );

  return firestoreData;
}

class TradesRecordDocumentEquality implements Equality<TradesRecord> {
  const TradesRecordDocumentEquality();

  @override
  bool equals(TradesRecord? e1, TradesRecord? e2) {
    return e1?.trades == e2?.trades && e1?.subject == e2?.subject;
  }

  @override
  int hash(TradesRecord? e) =>
      const ListEquality().hash([e?.trades, e?.subject]);

  @override
  bool isValidKey(Object? o) => o is TradesRecord;
}
