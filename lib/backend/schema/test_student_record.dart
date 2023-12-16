import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TestStudentRecord extends FirestoreRecord {
  TestStudentRecord._(
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

  // "test_id" field.
  String? _testId;
  String get testId => _testId ?? '';
  bool hasTestId() => _testId != null;

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

  // "Student_Reference" field.
  DocumentReference? _studentReference;
  DocumentReference? get studentReference => _studentReference;
  bool hasStudentReference() => _studentReference != null;

  // "Is_Complete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  void _initializeFields() {
    _testName = snapshotData['test_name'] as String?;
    _totalQuestion = castToType<int>(snapshotData['total_question']);
    _duration = castToType<int>(snapshotData['duration']);
    _testId = snapshotData['test_id'] as String?;
    _marksPerQuestion = castToType<int>(snapshotData['marks_per_question']);
    _testType = snapshotData['test_type'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _studentReference = snapshotData['Student_Reference'] as DocumentReference?;
    _isComplete = snapshotData['Is_Complete'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test_Student');

  static Stream<TestStudentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestStudentRecord.fromSnapshot(s));

  static Future<TestStudentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestStudentRecord.fromSnapshot(s));

  static TestStudentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestStudentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestStudentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestStudentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestStudentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestStudentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestStudentRecordData({
  String? testName,
  int? totalQuestion,
  int? duration,
  String? testId,
  int? marksPerQuestion,
  String? testType,
  DateTime? time,
  DocumentReference? studentReference,
  bool? isComplete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'test_name': testName,
      'total_question': totalQuestion,
      'duration': duration,
      'test_id': testId,
      'marks_per_question': marksPerQuestion,
      'test_type': testType,
      'time': time,
      'Student_Reference': studentReference,
      'Is_Complete': isComplete,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestStudentRecordDocumentEquality implements Equality<TestStudentRecord> {
  const TestStudentRecordDocumentEquality();

  @override
  bool equals(TestStudentRecord? e1, TestStudentRecord? e2) {
    return e1?.testName == e2?.testName &&
        e1?.totalQuestion == e2?.totalQuestion &&
        e1?.duration == e2?.duration &&
        e1?.testId == e2?.testId &&
        e1?.marksPerQuestion == e2?.marksPerQuestion &&
        e1?.testType == e2?.testType &&
        e1?.time == e2?.time &&
        e1?.studentReference == e2?.studentReference &&
        e1?.isComplete == e2?.isComplete;
  }

  @override
  int hash(TestStudentRecord? e) => const ListEquality().hash([
        e?.testName,
        e?.totalQuestion,
        e?.duration,
        e?.testId,
        e?.marksPerQuestion,
        e?.testType,
        e?.time,
        e?.studentReference,
        e?.isComplete
      ]);

  @override
  bool isValidKey(Object? o) => o is TestStudentRecord;
}
