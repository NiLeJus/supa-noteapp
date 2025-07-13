import '/components/molecules/neuro_btn/neuro_btn_widget.dart';
import '/components/molecules/note_tags_component/note_tags_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'note_view_page_widget.dart' show NoteViewPageWidget;
import 'package:flutter/material.dart';

class NoteViewPageModel extends FlutterFlowModel<NoteViewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Neuro_Btn_Cancel.
  late NeuroBtnModel neuroBtnCancelModel;
  // Models for NoteTags_Component dynamic component.
  late FlutterFlowDynamicModels<NoteTagsComponentModel> noteTagsComponentModels;
  // Model for Neuro_Btn component.
  late NeuroBtnModel neuroBtnModel;
  // Model for Neuro_Btn_Modify.
  late NeuroBtnModel neuroBtnModifyModel;

  @override
  void initState(BuildContext context) {
    neuroBtnCancelModel = createModel(context, () => NeuroBtnModel());
    noteTagsComponentModels =
        FlutterFlowDynamicModels(() => NoteTagsComponentModel());
    neuroBtnModel = createModel(context, () => NeuroBtnModel());
    neuroBtnModifyModel = createModel(context, () => NeuroBtnModel());
  }

  @override
  void dispose() {
    neuroBtnCancelModel.dispose();
    noteTagsComponentModels.dispose();
    neuroBtnModel.dispose();
    neuroBtnModifyModel.dispose();
  }
}
