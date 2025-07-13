import '/backend/supabase/supabase.dart';
import '/components/molecules/neuro_btn/neuro_btn_widget.dart';
import '/components/molecules/note_tags_component/note_tags_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'taking_note_page_widget.dart' show TakingNotePageWidget;
import 'package:flutter/material.dart';

class TakingNotePageModel extends FlutterFlowModel<TakingNotePageWidget> {
  ///  Local state fields for this page.

  String? title;

  List<String> tagsList = [];
  void addToTagsList(String item) => tagsList.add(item);
  void removeFromTagsList(String item) => tagsList.remove(item);
  void removeAtIndexFromTagsList(int index) => tagsList.removeAt(index);
  void insertAtIndexInTagsList(int index, String item) =>
      tagsList.insert(index, item);
  void updateTagsListAtIndex(int index, Function(String) updateFn) =>
      tagsList[index] = updateFn(tagsList[index]);

  String? body;

  bool isPreview = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in TakingNote_Page widget.
  List<NotesRow>? noteResponse;
  // State field(s) for Title_TextField widget.
  FocusNode? titleTextFieldFocusNode;
  TextEditingController? titleTextFieldTextController;
  String? Function(BuildContext, String?)?
      titleTextFieldTextControllerValidator;
  // State field(s) for Tags_TextField widget.
  FocusNode? tagsTextFieldFocusNode;
  TextEditingController? tagsTextFieldTextController;
  String? Function(BuildContext, String?)? tagsTextFieldTextControllerValidator;
  // Model for Neuro_Btn component.
  late NeuroBtnModel neuroBtnModel;
  // Models for NoteTags_Component dynamic component.
  late FlutterFlowDynamicModels<NoteTagsComponentModel> noteTagsComponentModels;
  // State field(s) for Body_TextField widget.
  FocusNode? bodyTextFieldFocusNode;
  TextEditingController? bodyTextFieldTextController;
  String? Function(BuildContext, String?)? bodyTextFieldTextControllerValidator;
  // Model for Neuro_Btn_Cancel.
  late NeuroBtnModel neuroBtnCancelModel;
  // Model for Neuro_Btn_Help.
  late NeuroBtnModel neuroBtnHelpModel;
  // Model for Neuro_Btn_Modify.
  late NeuroBtnModel neuroBtnModifyModel;
  // Model for Neuro_Btn_Preview.
  late NeuroBtnModel neuroBtnPreviewModel;

  @override
  void initState(BuildContext context) {
    neuroBtnModel = createModel(context, () => NeuroBtnModel());
    noteTagsComponentModels =
        FlutterFlowDynamicModels(() => NoteTagsComponentModel());
    neuroBtnCancelModel = createModel(context, () => NeuroBtnModel());
    neuroBtnHelpModel = createModel(context, () => NeuroBtnModel());
    neuroBtnModifyModel = createModel(context, () => NeuroBtnModel());
    neuroBtnPreviewModel = createModel(context, () => NeuroBtnModel());
  }

  @override
  void dispose() {
    titleTextFieldFocusNode?.dispose();
    titleTextFieldTextController?.dispose();

    tagsTextFieldFocusNode?.dispose();
    tagsTextFieldTextController?.dispose();

    neuroBtnModel.dispose();
    noteTagsComponentModels.dispose();
    bodyTextFieldFocusNode?.dispose();
    bodyTextFieldTextController?.dispose();

    neuroBtnCancelModel.dispose();
    neuroBtnHelpModel.dispose();
    neuroBtnModifyModel.dispose();
    neuroBtnPreviewModel.dispose();
  }
}
