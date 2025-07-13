import '/flutter_flow/flutter_flow_util.dart';
import 'search_bar_component_widget.dart' show SearchBarComponentWidget;
import 'package:flutter/material.dart';

class SearchBarComponentModel
    extends FlutterFlowModel<SearchBarComponentWidget> {
  ///  Local state fields for this component.

  bool isExpanded = true;

  int focusedWidth = 40;

  int notFocusedWidth = 40;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
