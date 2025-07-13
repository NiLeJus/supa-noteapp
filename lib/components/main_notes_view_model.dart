import '/backend/supabase/supabase.dart';
import '/components/organisme/note_displayer_s_m_widget/note_displayer_s_m_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_notes_view_widget.dart' show MainNotesViewWidget;
import 'package:flutter/material.dart';

class MainNotesViewModel extends FlutterFlowModel<MainNotesViewWidget> {
  ///  Local state fields for this component.

  List<NotesRow> qNotesResults = [];
  void addToQNotesResults(NotesRow item) => qNotesResults.add(item);
  void removeFromQNotesResults(NotesRow item) => qNotesResults.remove(item);
  void removeAtIndexFromQNotesResults(int index) =>
      qNotesResults.removeAt(index);
  void insertAtIndexInQNotesResults(int index, NotesRow item) =>
      qNotesResults.insert(index, item);
  void updateQNotesResultsAtIndex(int index, Function(NotesRow) updateFn) =>
      qNotesResults[index] = updateFn(qNotesResults[index]);

  ///  State fields for stateful widgets in this component.

  // Models for Note_DisplayerSM_Widget dynamic component.
  late FlutterFlowDynamicModels<NoteDisplayerSMWidgetModel>
      noteDisplayerSMWidgetModels;
  // Stores action output result for [Backend Call - Query Rows] action in Note_DisplayerSM_Widget widget.
  List<NotesRow>? filteredRowsCopy;
  // Stores action output result for [Backend Call - Query Rows] action in Note_DisplayerSM_Widget widget.
  List<NotesRow>? rowsCopy;

  @override
  void initState(BuildContext context) {
    noteDisplayerSMWidgetModels =
        FlutterFlowDynamicModels(() => NoteDisplayerSMWidgetModel());
  }

  @override
  void dispose() {
    noteDisplayerSMWidgetModels.dispose();
  }
}
