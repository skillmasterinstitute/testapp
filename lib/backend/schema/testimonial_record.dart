import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TestimonialRecord extends FirestoreRecord {
  TestimonialRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "pic" field.
  String? _pic;
  String get pic => _pic ?? '';
  bool hasPic() => _pic != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "course" field.
  String? _course;
  String get course => _course ?? '';
  bool hasCourse() => _course != null;

  // "IsVisible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  bool hasIsVisible() => _isVisible != null;

  // "NSTI" field.
  String? _nsti;
  String get nsti => _nsti ?? '';
  bool hasNsti() => _nsti != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _pic = snapshotData['pic'] as String?;
    _comment = snapshotData['comment'] as String?;
    _course = snapshotData['course'] as String?;
    _isVisible = snapshotData['IsVisible'] as bool?;
    _nsti = snapshotData['NSTI'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testimonial');

  static Stream<TestimonialRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestimonialRecord.fromSnapshot(s));

  static Future<TestimonialRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestimonialRecord.fromSnapshot(s));

  static TestimonialRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestimonialRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestimonialRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestimonialRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestimonialRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestimonialRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestimonialRecordData({
  String? name,
  String? pic,
  String? comment,
  String? course,
  bool? isVisible,
  String? nsti,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'pic': pic,
      'comment': comment,
      'course': course,
      'IsVisible': isVisible,
      'NSTI': nsti,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestimonialRecordDocumentEquality implements Equality<TestimonialRecord> {
  const TestimonialRecordDocumentEquality();

  @override
  bool equals(TestimonialRecord? e1, TestimonialRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.pic == e2?.pic &&
        e1?.comment == e2?.comment &&
        e1?.course == e2?.course &&
        e1?.isVisible == e2?.isVisible &&
        e1?.nsti == e2?.nsti;
  }

  @override
  int hash(TestimonialRecord? e) => const ListEquality()
      .hash([e?.name, e?.pic, e?.comment, e?.course, e?.isVisible, e?.nsti]);

  @override
  bool isValidKey(Object? o) => o is TestimonialRecord;
}
