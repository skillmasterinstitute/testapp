import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class QuestionFinalRecord extends FirestoreRecord {
  QuestionFinalRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "op1" field.
  String? _op1;
  String get op1 => _op1 ?? '';
  bool hasOp1() => _op1 != null;

  // "bol1" field.
  bool? _bol1;
  bool get bol1 => _bol1 ?? false;
  bool hasBol1() => _bol1 != null;

  // "op2" field.
  String? _op2;
  String get op2 => _op2 ?? '';
  bool hasOp2() => _op2 != null;

  // "bol2" field.
  bool? _bol2;
  bool get bol2 => _bol2 ?? false;
  bool hasBol2() => _bol2 != null;

  // "op3" field.
  String? _op3;
  String get op3 => _op3 ?? '';
  bool hasOp3() => _op3 != null;

  // "bol3" field.
  bool? _bol3;
  bool get bol3 => _bol3 ?? false;
  bool hasBol3() => _bol3 != null;

  // "op4" field.
  String? _op4;
  String get op4 => _op4 ?? '';
  bool hasOp4() => _op4 != null;

  // "bol4" field.
  bool? _bol4;
  bool get bol4 => _bol4 ?? false;
  bool hasBol4() => _bol4 != null;

  // "test_Reference" field.
  DocumentReference? _testReference;
  DocumentReference? get testReference => _testReference;
  bool hasTestReference() => _testReference != null;

  // "indexNo" field.
  int? _indexNo;
  int get indexNo => _indexNo ?? 0;
  bool hasIndexNo() => _indexNo != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _question = snapshotData['Question'] as String?;
    _op1 = snapshotData['op1'] as String?;
    _bol1 = snapshotData['bol1'] as bool?;
    _op2 = snapshotData['op2'] as String?;
    _bol2 = snapshotData['bol2'] as bool?;
    _op3 = snapshotData['op3'] as String?;
    _bol3 = snapshotData['bol3'] as bool?;
    _op4 = snapshotData['op4'] as String?;
    _bol4 = snapshotData['bol4'] as bool?;
    _testReference = snapshotData['test_Reference'] as DocumentReference?;
    _indexNo = castToType<int>(snapshotData['indexNo']);
    _image = snapshotData['Image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question_Final');

  static Stream<QuestionFinalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionFinalRecord.fromSnapshot(s));

  static Future<QuestionFinalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionFinalRecord.fromSnapshot(s));

  static QuestionFinalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionFinalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionFinalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionFinalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionFinalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionFinalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionFinalRecordData({
  String? question,
  String? op1,
  bool? bol1,
  String? op2,
  bool? bol2,
  String? op3,
  bool? bol3,
  String? op4,
  bool? bol4,
  DocumentReference? testReference,
  int? indexNo,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Question': question,
      'op1': op1,
      'bol1': bol1,
      'op2': op2,
      'bol2': bol2,
      'op3': op3,
      'bol3': bol3,
      'op4': op4,
      'bol4': bol4,
      'test_Reference': testReference,
      'indexNo': indexNo,
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionFinalRecordDocumentEquality
    implements Equality<QuestionFinalRecord> {
  const QuestionFinalRecordDocumentEquality();

  @override
  bool equals(QuestionFinalRecord? e1, QuestionFinalRecord? e2) {
    return e1?.question == e2?.question &&
        e1?.op1 == e2?.op1 &&
        e1?.bol1 == e2?.bol1 &&
        e1?.op2 == e2?.op2 &&
        e1?.bol2 == e2?.bol2 &&
        e1?.op3 == e2?.op3 &&
        e1?.bol3 == e2?.bol3 &&
        e1?.op4 == e2?.op4 &&
        e1?.bol4 == e2?.bol4 &&
        e1?.testReference == e2?.testReference &&
        e1?.indexNo == e2?.indexNo &&
        e1?.image == e2?.image;
  }

  @override
  int hash(QuestionFinalRecord? e) => const ListEquality().hash([
        e?.question,
        e?.op1,
        e?.bol1,
        e?.op2,
        e?.bol2,
        e?.op3,
        e?.bol3,
        e?.op4,
        e?.bol4,
        e?.testReference,
        e?.indexNo,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionFinalRecord;
}
