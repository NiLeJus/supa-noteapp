// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteStruct extends BaseStruct {
  NoteStruct({
    String? title,
    String? body,
    List<String>? tags,
    String? noteUID,
  })  : _title = title,
        _body = body,
        _tags = tags,
        _noteUID = noteUID;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  set body(String? val) => _body = val;

  bool hasBody() => _body != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  set tags(List<String>? val) => _tags = val;

  void updateTags(Function(List<String>) updateFn) {
    updateFn(_tags ??= []);
  }

  bool hasTags() => _tags != null;

  // "noteUID" field.
  String? _noteUID;
  String get noteUID => _noteUID ?? '';
  set noteUID(String? val) => _noteUID = val;

  bool hasNoteUID() => _noteUID != null;

  static NoteStruct fromMap(Map<String, dynamic> data) => NoteStruct(
        title: data['title'] as String?,
        body: data['body'] as String?,
        tags: getDataList(data['tags']),
        noteUID: data['noteUID'] as String?,
      );

  static NoteStruct? maybeFromMap(dynamic data) =>
      data is Map ? NoteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'body': _body,
        'tags': _tags,
        'noteUID': _noteUID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'body': serializeParam(
          _body,
          ParamType.String,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.String,
          isList: true,
        ),
        'noteUID': serializeParam(
          _noteUID,
          ParamType.String,
        ),
      }.withoutNulls;

  static NoteStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoteStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        body: deserializeParam(
          data['body'],
          ParamType.String,
          false,
        ),
        tags: deserializeParam<String>(
          data['tags'],
          ParamType.String,
          true,
        ),
        noteUID: deserializeParam(
          data['noteUID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NoteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NoteStruct &&
        title == other.title &&
        body == other.body &&
        listEquality.equals(tags, other.tags) &&
        noteUID == other.noteUID;
  }

  @override
  int get hashCode => const ListEquality().hash([title, body, tags, noteUID]);
}

NoteStruct createNoteStruct({
  String? title,
  String? body,
  String? noteUID,
}) =>
    NoteStruct(
      title: title,
      body: body,
      noteUID: noteUID,
    );
