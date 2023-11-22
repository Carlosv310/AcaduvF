// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NameStruct extends FFFirebaseStruct {
  NameStruct({
    List<bool>? username,
    List<bool>? usergrade,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        _usergrade = usergrade,
        super(firestoreUtilData);

  // "username" field.
  List<bool>? _username;
  List<bool> get username => _username ?? const [];
  set username(List<bool>? val) => _username = val;
  void updateUsername(Function(List<bool>) updateFn) =>
      updateFn(_username ??= []);
  bool hasUsername() => _username != null;

  // "usergrade" field.
  List<bool>? _usergrade;
  List<bool> get usergrade => _usergrade ?? const [];
  set usergrade(List<bool>? val) => _usergrade = val;
  void updateUsergrade(Function(List<bool>) updateFn) =>
      updateFn(_usergrade ??= []);
  bool hasUsergrade() => _usergrade != null;

  static NameStruct fromMap(Map<String, dynamic> data) => NameStruct(
        username: getDataList(data['username']),
        usergrade: getDataList(data['usergrade']),
      );

  static NameStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NameStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'usergrade': _usergrade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.bool,
          true,
        ),
        'usergrade': serializeParam(
          _usergrade,
          ParamType.bool,
          true,
        ),
      }.withoutNulls;

  static NameStruct fromSerializableMap(Map<String, dynamic> data) =>
      NameStruct(
        username: deserializeParam<bool>(
          data['username'],
          ParamType.bool,
          true,
        ),
        usergrade: deserializeParam<bool>(
          data['usergrade'],
          ParamType.bool,
          true,
        ),
      );

  @override
  String toString() => 'NameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NameStruct &&
        listEquality.equals(username, other.username) &&
        listEquality.equals(usergrade, other.usergrade);
  }

  @override
  int get hashCode => const ListEquality().hash([username, usergrade]);
}

NameStruct createNameStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NameStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NameStruct? updateNameStruct(
  NameStruct? name, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    name
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNameStructData(
  Map<String, dynamic> firestoreData,
  NameStruct? name,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (name == null) {
    return;
  }
  if (name.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && name.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nameData = getNameFirestoreData(name, forFieldValue);
  final nestedData = nameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = name.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNameFirestoreData(
  NameStruct? name, [
  bool forFieldValue = false,
]) {
  if (name == null) {
    return {};
  }
  final firestoreData = mapToFirestore(name.toMap());

  // Add any Firestore field values
  name.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNameListFirestoreData(
  List<NameStruct>? names,
) =>
    names?.map((e) => getNameFirestoreData(e, true)).toList() ?? [];
