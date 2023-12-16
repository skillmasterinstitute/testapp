import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SliderRecord extends FirestoreRecord {
  SliderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Image1" field.
  String? _image1;
  String get image1 => _image1 ?? '';
  bool hasImage1() => _image1 != null;

  // "Image2" field.
  String? _image2;
  String get image2 => _image2 ?? '';
  bool hasImage2() => _image2 != null;

  // "Image3" field.
  String? _image3;
  String get image3 => _image3 ?? '';
  bool hasImage3() => _image3 != null;

  // "Image4" field.
  String? _image4;
  String get image4 => _image4 ?? '';
  bool hasImage4() => _image4 != null;

  // "Image5" field.
  String? _image5;
  String get image5 => _image5 ?? '';
  bool hasImage5() => _image5 != null;

  // "Image6" field.
  String? _image6;
  String get image6 => _image6 ?? '';
  bool hasImage6() => _image6 != null;

  // "Image7" field.
  String? _image7;
  String get image7 => _image7 ?? '';
  bool hasImage7() => _image7 != null;

  // "Image8" field.
  String? _image8;
  String get image8 => _image8 ?? '';
  bool hasImage8() => _image8 != null;

  // "Image9" field.
  String? _image9;
  String get image9 => _image9 ?? '';
  bool hasImage9() => _image9 != null;

  // "Image10" field.
  String? _image10;
  String get image10 => _image10 ?? '';
  bool hasImage10() => _image10 != null;

  // "ID1" field.
  DocumentReference? _id1;
  DocumentReference? get id1 => _id1;
  bool hasId1() => _id1 != null;

  // "ID2" field.
  DocumentReference? _id2;
  DocumentReference? get id2 => _id2;
  bool hasId2() => _id2 != null;

  // "ID3" field.
  DocumentReference? _id3;
  DocumentReference? get id3 => _id3;
  bool hasId3() => _id3 != null;

  // "ID4" field.
  DocumentReference? _id4;
  DocumentReference? get id4 => _id4;
  bool hasId4() => _id4 != null;

  // "ID5" field.
  DocumentReference? _id5;
  DocumentReference? get id5 => _id5;
  bool hasId5() => _id5 != null;

  // "ID6" field.
  DocumentReference? _id6;
  DocumentReference? get id6 => _id6;
  bool hasId6() => _id6 != null;

  // "ID7" field.
  DocumentReference? _id7;
  DocumentReference? get id7 => _id7;
  bool hasId7() => _id7 != null;

  // "ID8" field.
  DocumentReference? _id8;
  DocumentReference? get id8 => _id8;
  bool hasId8() => _id8 != null;

  // "ID9" field.
  DocumentReference? _id9;
  DocumentReference? get id9 => _id9;
  bool hasId9() => _id9 != null;

  // "ID10" field.
  DocumentReference? _id10;
  DocumentReference? get id10 => _id10;
  bool hasId10() => _id10 != null;

  void _initializeFields() {
    _image1 = snapshotData['Image1'] as String?;
    _image2 = snapshotData['Image2'] as String?;
    _image3 = snapshotData['Image3'] as String?;
    _image4 = snapshotData['Image4'] as String?;
    _image5 = snapshotData['Image5'] as String?;
    _image6 = snapshotData['Image6'] as String?;
    _image7 = snapshotData['Image7'] as String?;
    _image8 = snapshotData['Image8'] as String?;
    _image9 = snapshotData['Image9'] as String?;
    _image10 = snapshotData['Image10'] as String?;
    _id1 = snapshotData['ID1'] as DocumentReference?;
    _id2 = snapshotData['ID2'] as DocumentReference?;
    _id3 = snapshotData['ID3'] as DocumentReference?;
    _id4 = snapshotData['ID4'] as DocumentReference?;
    _id5 = snapshotData['ID5'] as DocumentReference?;
    _id6 = snapshotData['ID6'] as DocumentReference?;
    _id7 = snapshotData['ID7'] as DocumentReference?;
    _id8 = snapshotData['ID8'] as DocumentReference?;
    _id9 = snapshotData['ID9'] as DocumentReference?;
    _id10 = snapshotData['ID10'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Slider');

  static Stream<SliderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SliderRecord.fromSnapshot(s));

  static Future<SliderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SliderRecord.fromSnapshot(s));

  static SliderRecord fromSnapshot(DocumentSnapshot snapshot) => SliderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SliderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SliderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SliderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SliderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSliderRecordData({
  String? image1,
  String? image2,
  String? image3,
  String? image4,
  String? image5,
  String? image6,
  String? image7,
  String? image8,
  String? image9,
  String? image10,
  DocumentReference? id1,
  DocumentReference? id2,
  DocumentReference? id3,
  DocumentReference? id4,
  DocumentReference? id5,
  DocumentReference? id6,
  DocumentReference? id7,
  DocumentReference? id8,
  DocumentReference? id9,
  DocumentReference? id10,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Image1': image1,
      'Image2': image2,
      'Image3': image3,
      'Image4': image4,
      'Image5': image5,
      'Image6': image6,
      'Image7': image7,
      'Image8': image8,
      'Image9': image9,
      'Image10': image10,
      'ID1': id1,
      'ID2': id2,
      'ID3': id3,
      'ID4': id4,
      'ID5': id5,
      'ID6': id6,
      'ID7': id7,
      'ID8': id8,
      'ID9': id9,
      'ID10': id10,
    }.withoutNulls,
  );

  return firestoreData;
}

class SliderRecordDocumentEquality implements Equality<SliderRecord> {
  const SliderRecordDocumentEquality();

  @override
  bool equals(SliderRecord? e1, SliderRecord? e2) {
    return e1?.image1 == e2?.image1 &&
        e1?.image2 == e2?.image2 &&
        e1?.image3 == e2?.image3 &&
        e1?.image4 == e2?.image4 &&
        e1?.image5 == e2?.image5 &&
        e1?.image6 == e2?.image6 &&
        e1?.image7 == e2?.image7 &&
        e1?.image8 == e2?.image8 &&
        e1?.image9 == e2?.image9 &&
        e1?.image10 == e2?.image10 &&
        e1?.id1 == e2?.id1 &&
        e1?.id2 == e2?.id2 &&
        e1?.id3 == e2?.id3 &&
        e1?.id4 == e2?.id4 &&
        e1?.id5 == e2?.id5 &&
        e1?.id6 == e2?.id6 &&
        e1?.id7 == e2?.id7 &&
        e1?.id8 == e2?.id8 &&
        e1?.id9 == e2?.id9 &&
        e1?.id10 == e2?.id10;
  }

  @override
  int hash(SliderRecord? e) => const ListEquality().hash([
        e?.image1,
        e?.image2,
        e?.image3,
        e?.image4,
        e?.image5,
        e?.image6,
        e?.image7,
        e?.image8,
        e?.image9,
        e?.image10,
        e?.id1,
        e?.id2,
        e?.id3,
        e?.id4,
        e?.id5,
        e?.id6,
        e?.id7,
        e?.id8,
        e?.id9,
        e?.id10
      ]);

  @override
  bool isValidKey(Object? o) => o is SliderRecord;
}
