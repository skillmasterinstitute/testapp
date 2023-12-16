// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InputQuestionStruct extends FFFirebaseStruct {
  InputQuestionStruct({
    List<String>? input,
    List<InputQuestionStruct>? input1,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _input = input,
        _input1 = input1,
        super(firestoreUtilData);

  // "input" field.
  List<String>? _input;
  List<String> get input => _input ?? const [];
  set input(List<String>? val) => _input = val;
  void updateInput(Function(List<String>) updateFn) => updateFn(_input ??= []);
  bool hasInput() => _input != null;

  // "input1" field.
  List<InputQuestionStruct>? _input1;
  List<InputQuestionStruct> get input1 => _input1 ?? const [];
  set input1(List<InputQuestionStruct>? val) => _input1 = val;
  void updateInput1(Function(List<InputQuestionStruct>) updateFn) =>
      updateFn(_input1 ??= []);
  bool hasInput1() => _input1 != null;

  static InputQuestionStruct fromMap(Map<String, dynamic> data) =>
      InputQuestionStruct(
        input: getDataList(data['input']),
        input1: getStructList(
          data['input1'],
          InputQuestionStruct.fromMap,
        ),
      );

  static InputQuestionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? InputQuestionStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'input': _input,
        'input1': _input1?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'input': serializeParam(
          _input,
          ParamType.String,
          true,
        ),
        'input1': serializeParam(
          _input1,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static InputQuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      InputQuestionStruct(
        input: deserializeParam<String>(
          data['input'],
          ParamType.String,
          true,
        ),
        input1: deserializeStructParam<InputQuestionStruct>(
          data['input1'],
          ParamType.DataStruct,
          true,
          structBuilder: InputQuestionStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'InputQuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InputQuestionStruct &&
        listEquality.equals(input, other.input) &&
        listEquality.equals(input1, other.input1);
  }

  @override
  int get hashCode => const ListEquality().hash([input, input1]);
}

InputQuestionStruct createInputQuestionStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InputQuestionStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InputQuestionStruct? updateInputQuestionStruct(
  InputQuestionStruct? inputQuestion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    inputQuestion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInputQuestionStructData(
  Map<String, dynamic> firestoreData,
  InputQuestionStruct? inputQuestion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (inputQuestion == null) {
    return;
  }
  if (inputQuestion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && inputQuestion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final inputQuestionData =
      getInputQuestionFirestoreData(inputQuestion, forFieldValue);
  final nestedData =
      inputQuestionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = inputQuestion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInputQuestionFirestoreData(
  InputQuestionStruct? inputQuestion, [
  bool forFieldValue = false,
]) {
  if (inputQuestion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(inputQuestion.toMap());

  // Add any Firestore field values
  inputQuestion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInputQuestionListFirestoreData(
  List<InputQuestionStruct>? inputQuestions,
) =>
    inputQuestions
        ?.map((e) => getInputQuestionFirestoreData(e, true))
        .toList() ??
    [];
