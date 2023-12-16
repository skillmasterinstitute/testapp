import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "IsPremium" field.
  bool? _isPremium;
  bool get isPremium => _isPremium ?? false;
  bool hasIsPremium() => _isPremium != null;

  // "Premium_Till" field.
  DateTime? _premiumTill;
  DateTime? get premiumTill => _premiumTill;
  bool hasPremiumTill() => _premiumTill != null;

  // "Profile_CompleteD" field.
  bool? _profileCompleteD;
  bool get profileCompleteD => _profileCompleteD ?? false;
  bool hasProfileCompleteD() => _profileCompleteD != null;

  // "NSTI" field.
  String? _nsti;
  String get nsti => _nsti ?? '';
  bool hasNsti() => _nsti != null;

  // "Trade" field.
  String? _trade;
  String get trade => _trade ?? '';
  bool hasTrade() => _trade != null;

  // "SubjectType" field.
  int? _subjectType;
  int get subjectType => _subjectType ?? 0;
  bool hasSubjectType() => _subjectType != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "GainedMarks" field.
  int? _gainedMarks;
  int get gainedMarks => _gainedMarks ?? 0;
  bool hasGainedMarks() => _gainedMarks != null;

  // "TotalMarks" field.
  int? _totalMarks;
  int get totalMarks => _totalMarks ?? 0;
  bool hasTotalMarks() => _totalMarks != null;

  // "TestAttempted" field.
  int? _testAttempted;
  int get testAttempted => _testAttempted ?? 0;
  bool hasTestAttempted() => _testAttempted != null;

  // "SkillPoints" field.
  double? _skillPoints;
  double get skillPoints => _skillPoints ?? 0.0;
  bool hasSkillPoints() => _skillPoints != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isPremium = snapshotData['IsPremium'] as bool?;
    _premiumTill = snapshotData['Premium_Till'] as DateTime?;
    _profileCompleteD = snapshotData['Profile_CompleteD'] as bool?;
    _nsti = snapshotData['NSTI'] as String?;
    _trade = snapshotData['Trade'] as String?;
    _subjectType = castToType<int>(snapshotData['SubjectType']);
    _gender = snapshotData['Gender'] as String?;
    _gainedMarks = castToType<int>(snapshotData['GainedMarks']);
    _totalMarks = castToType<int>(snapshotData['TotalMarks']);
    _testAttempted = castToType<int>(snapshotData['TestAttempted']);
    _skillPoints = castToType<double>(snapshotData['SkillPoints']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isPremium,
  DateTime? premiumTill,
  bool? profileCompleteD,
  String? nsti,
  String? trade,
  int? subjectType,
  String? gender,
  int? gainedMarks,
  int? totalMarks,
  int? testAttempted,
  double? skillPoints,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'IsPremium': isPremium,
      'Premium_Till': premiumTill,
      'Profile_CompleteD': profileCompleteD,
      'NSTI': nsti,
      'Trade': trade,
      'SubjectType': subjectType,
      'Gender': gender,
      'GainedMarks': gainedMarks,
      'TotalMarks': totalMarks,
      'TestAttempted': testAttempted,
      'SkillPoints': skillPoints,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isPremium == e2?.isPremium &&
        e1?.premiumTill == e2?.premiumTill &&
        e1?.profileCompleteD == e2?.profileCompleteD &&
        e1?.nsti == e2?.nsti &&
        e1?.trade == e2?.trade &&
        e1?.subjectType == e2?.subjectType &&
        e1?.gender == e2?.gender &&
        e1?.gainedMarks == e2?.gainedMarks &&
        e1?.totalMarks == e2?.totalMarks &&
        e1?.testAttempted == e2?.testAttempted &&
        e1?.skillPoints == e2?.skillPoints;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isPremium,
        e?.premiumTill,
        e?.profileCompleteD,
        e?.nsti,
        e?.trade,
        e?.subjectType,
        e?.gender,
        e?.gainedMarks,
        e?.totalMarks,
        e?.testAttempted,
        e?.skillPoints
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
