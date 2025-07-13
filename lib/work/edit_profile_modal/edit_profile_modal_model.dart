import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_modal_widget.dart' show EditProfileModalWidget;
import 'package:flutter/material.dart';

class EditProfileModalModel extends FlutterFlowModel<EditProfileModalWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataVt9 = false;
  FFUploadedFile uploadedLocalFile_uploadDataVt9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataVt9 = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();
  }
}
