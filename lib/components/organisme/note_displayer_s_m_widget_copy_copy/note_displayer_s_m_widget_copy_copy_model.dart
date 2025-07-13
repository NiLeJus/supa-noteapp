import '/components/molecules/note_tags_component/note_tags_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'note_displayer_s_m_widget_copy_copy_widget.dart'
    show NoteDisplayerSMWidgetCopyCopyWidget;
import 'package:flutter/material.dart';

class NoteDisplayerSMWidgetCopyCopyModel
    extends FlutterFlowModel<NoteDisplayerSMWidgetCopyCopyWidget> {
  ///  Local state fields for this component.

  double maxWidth = 180.0;

  double maxHeight = 350.0;

  ///  State fields for stateful widgets in this component.

  // Models for NoteTags_Component dynamic component.
  late FlutterFlowDynamicModels<NoteTagsComponentModel> noteTagsComponentModels;

  @override
  void initState(BuildContext context) {
    noteTagsComponentModels =
        FlutterFlowDynamicModels(() => NoteTagsComponentModel());
  }

  @override
  void dispose() {
    noteTagsComponentModels.dispose();
  }
}
