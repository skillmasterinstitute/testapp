import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class StudyMaterialRecord extends FirestoreRecord {
  StudyMaterialRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "Content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "File" field.
  String? _file;
  String get file => _file ?? '';
  bool hasFile() => _file != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "StudentRefernce" field.
  DocumentReference? _studentRefernce;
  DocumentReference? get studentRefernce => _studentRefernce;
  bool hasStudentRefernce() => _studentRefernce != null;

  void _initializeFields() {
    _type = snapshotData['Type'] as String?;
    _createdDate = snapshotData['CreatedDate'] as DateTime?;
    _content = snapshotData['Content'] as String?;
    _file = snapshotData['File'] as String?;
    _title = snapshotData['Title'] as String?;
    _studentRefernce = snapshotData['StudentRefernce'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('StudyMaterial');

  static Stream<StudyMaterialRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudyMaterialRecord.fromSnapshot(s));

  static Future<StudyMaterialRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudyMaterialRecord.fromSnapshot(s));

  static StudyMaterialRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudyMaterialRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudyMaterialRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudyMaterialRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudyMaterialRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudyMaterialRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudyMaterialRecordData({
  String? type,
  DateTime? createdDate,
  String? content,
  String? file,
  String? title,
  DocumentReference? studentRefernce,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Type': type,
      'CreatedDate': createdDate,
      'Content': content,
      'File': file,
      'Title': title,
      'StudentRefernce': studentRefernce,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudyMaterialRecordDocumentEquality
    implements Equality<StudyMaterialRecord> {
  const StudyMaterialRecordDocumentEquality();

  @override
  bool equals(StudyMaterialRecord? e1, StudyMaterialRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.createdDate == e2?.createdDate &&
        e1?.content == e2?.content &&
        e1?.file == e2?.file &&
        e1?.title == e2?.title &&
        e1?.studentRefernce == e2?.studentRefernce;
  }

  @override
  int hash(StudyMaterialRecord? e) => const ListEquality().hash([
        e?.type,
        e?.createdDate,
        e?.content,
        e?.file,
        e?.title,
        e?.studentRefernce
      ]);

  @override
  bool isValidKey(Object? o) => o is StudyMaterialRecord;
}
