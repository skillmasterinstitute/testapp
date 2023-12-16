import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TestName" field.
  String? _testName;
  String get testName => _testName ?? '';
  bool hasTestName() => _testName != null;

  // "QuestionNo" field.
  String? _questionNo;
  String get questionNo => _questionNo ?? '';
  bool hasQuestionNo() => _questionNo != null;

  // "IsQuestion" field.
  bool? _isQuestion;
  bool get isQuestion => _isQuestion ?? false;
  bool hasIsQuestion() => _isQuestion != null;

  // "IsOption" field.
  bool? _isOption;
  bool get isOption => _isOption ?? false;
  bool hasIsOption() => _isOption != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Describe" field.
  String? _describe;
  String get describe => _describe ?? '';
  bool hasDescribe() => _describe != null;

  void _initializeFields() {
    _testName = snapshotData['TestName'] as String?;
    _questionNo = snapshotData['QuestionNo'] as String?;
    _isQuestion = snapshotData['IsQuestion'] as bool?;
    _isOption = snapshotData['IsOption'] as bool?;
    _image = snapshotData['Image'] as String?;
    _describe = snapshotData['Describe'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? testName,
  String? questionNo,
  bool? isQuestion,
  bool? isOption,
  String? image,
  String? describe,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TestName': testName,
      'QuestionNo': questionNo,
      'IsQuestion': isQuestion,
      'IsOption': isOption,
      'Image': image,
      'Describe': describe,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.testName == e2?.testName &&
        e1?.questionNo == e2?.questionNo &&
        e1?.isQuestion == e2?.isQuestion &&
        e1?.isOption == e2?.isOption &&
        e1?.image == e2?.image &&
        e1?.describe == e2?.describe;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.testName,
        e?.questionNo,
        e?.isQuestion,
        e?.isOption,
        e?.image,
        e?.describe
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
