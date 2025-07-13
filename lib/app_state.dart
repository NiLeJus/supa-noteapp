import 'package:flutter/material.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectedLayout = prefs.containsKey('ff_selectedLayout')
          ? deserializeEnum<ELayoutTypes>(prefs.getString('ff_selectedLayout'))
          : _selectedLayout;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// The layout user has selected
  ELayoutTypes? _selectedLayout = ELayoutTypes.Row;
  ELayoutTypes? get selectedLayout => _selectedLayout;
  set selectedLayout(ELayoutTypes? value) {
    _selectedLayout = value;
    value != null
        ? prefs.setString('ff_selectedLayout', value.serialize())
        : prefs.remove('ff_selectedLayout');
  }

  String _userDisplayName = '';
  String get userDisplayName => _userDisplayName;
  set userDisplayName(String value) {
    _userDisplayName = value;
  }

  String _userPic = '';
  String get userPic => _userPic;
  set userPic(String value) {
    _userPic = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
