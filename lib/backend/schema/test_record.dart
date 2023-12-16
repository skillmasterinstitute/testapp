import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TestRecord extends FirestoreRecord {
  TestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "test_name" field.
  String? _testName;
  String get testName => _testName ?? '';
  bool hasTestName() => _testName != null;

  // "total_question" field.
  int? _totalQuestion;
  int get totalQuestion => _totalQuestion ?? 0;
  bool hasTotalQuestion() => _totalQuestion != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "marks_per_question" field.
  int? _marksPerQuestion;
  int get marksPerQuestion => _marksPerQuestion ?? 0;
  bool hasMarksPerQuestion() => _marksPerQuestion != null;

  // "test_type" field.
  String? _testType;
  String get testType => _testType ?? '';
  bool hasTestType() => _testType != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "Index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  void _initializeFields() {
    _testName = snapshotData['test_name'] as String?;
    _totalQuestion = castToType<int>(snapshotData['total_question']);
    _duration = castToType<int>(snapshotData['duration']);
    _marksPerQuestion = castToType<int>(snapshotData['marks_per_question']);
    _testType = snapshotData['test_type'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _index = castToType<int>(snapshotData['Index']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test');

  static Stream<TestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestRecord.fromSnapshot(s));

  static Future<TestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestRecord.fromSnapshot(s));

  static TestRecord fromSnapshot(DocumentSnapshot snapshot) => TestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestRecordData({
  String? testName,
  int? totalQuestion,
  int? duration,
  int? marksPerQuestion,
  String? testType,
  DateTime? time,
  int? index,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'test_name': testName,
      'total_question': totalQuestion,
      'duration': duration,
      'marks_per_question': marksPerQuestion,
      'test_type': testType,
      'time': time,
      'Index': index,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestRecordDocumentEquality implements Equality<TestRecord> {
  const TestRecordDocumentEquality();

  @override
  bool equals(TestRecord? e1, TestRecord? e2) {
    return e1?.testName == e2?.testName &&
        e1?.totalQuestion == e2?.totalQuestion &&
        e1?.duration == e2?.duration &&
        e1?.marksPerQuestion == e2?.marksPerQuestion &&
        e1?.testType == e2?.testType &&
        e1?.time == e2?.time &&
        e1?.index == e2?.index;
  }

  @override
  int hash(TestRecord? e) => const ListEquality().hash([
        e?.testName,
        e?.totalQuestion,
        e?.duration,
        e?.marksPerQuestion,
        e?.testType,
        e?.time,
        e?.index
      ]);

  @override
  bool isValidKey(Object? o) => o is TestRecord;
}
