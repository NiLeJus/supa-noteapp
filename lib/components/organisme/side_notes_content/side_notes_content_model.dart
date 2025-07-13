import '/components/organisme/note_displayer_s_m_widget_copy_copy_copy/note_displayer_s_m_widget_copy_copy_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_notes_content_widget.dart' show SideNotesContentWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SideNotesContentModel extends FlutterFlowModel<SideNotesContentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for Note_DisplayerSM_WidgetCopyCopyCopy component.
  late NoteDisplayerSMWidgetCopyCopyCopyModel
      noteDisplayerSMWidgetCopyCopyCopyModel;

  @override
  void initState(BuildContext context) {
    noteDisplayerSMWidgetCopyCopyCopyModel =
        createModel(context, () => NoteDisplayerSMWidgetCopyCopyCopyModel());
  }

  @override
  void dispose() {
    expandableExpandableController.dispose();
    noteDisplayerSMWidgetCopyCopyCopyModel.dispose();
  }
}
