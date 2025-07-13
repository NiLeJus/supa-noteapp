import '/backend/supabase/supabase.dart';
import '/components/main_notes_view_widget.dart';
import '/components/organisme/side_account_content/side_account_content_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Home_Page widget.
  List<UsersRow>? userData;
  // Model for Side_Account_Content component.
  late SideAccountContentModel sideAccountContentModel1;
  // Model for Main_Notes_View component.
  late MainNotesViewModel mainNotesViewModel;
  // Model for Side_Account_Content component.
  late SideAccountContentModel sideAccountContentModel2;

  @override
  void initState(BuildContext context) {
    sideAccountContentModel1 =
        createModel(context, () => SideAccountContentModel());
    mainNotesViewModel = createModel(context, () => MainNotesViewModel());
    sideAccountContentModel2 =
        createModel(context, () => SideAccountContentModel());
  }

  @override
  void dispose() {
    sideAccountContentModel1.dispose();
    mainNotesViewModel.dispose();
    sideAccountContentModel2.dispose();
  }
}
