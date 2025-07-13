import '/components/molecules/neuro_btn/neuro_btn_widget.dart';
import '/components/molecules/note_tags_component/note_tags_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'note_view_widget_widget.dart' show NoteViewWidgetWidget;
import 'package:flutter/material.dart';

class NoteViewWidgetModel extends FlutterFlowModel<NoteViewWidgetWidget> {
  ///  Local state fields for this component.

  double maxWidth = 180.0;

  double maxHeight = 350.0;

  ///  State fields for stateful widgets in this component.

  // Models for NoteTags_Component dynamic component.
  late FlutterFlowDynamicModels<NoteTagsComponentModel> noteTagsComponentModels;
  // Model for Neuro_Btn component.
  late NeuroBtnModel neuroBtnModel1;
  // Model for Neuro_Btn component.
  late NeuroBtnModel neuroBtnModel2;
  // Model for Neuro_Btn component.
  late NeuroBtnModel neuroBtnModel3;

  @override
  void initState(BuildContext context) {
    noteTagsComponentModels =
        FlutterFlowDynamicModels(() => NoteTagsComponentModel());
    neuroBtnModel1 = createModel(context, () => NeuroBtnModel());
    neuroBtnModel2 = createModel(context, () => NeuroBtnModel());
    neuroBtnModel3 = createModel(context, () => NeuroBtnModel());
  }

  @override
  void dispose() {
    noteTagsComponentModels.dispose();
    neuroBtnModel1.dispose();
    neuroBtnModel2.dispose();
    neuroBtnModel3.dispose();
  }
}
