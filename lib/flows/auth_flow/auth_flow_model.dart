import '/flutter_flow/flutter_flow_util.dart';
import '/work/btn_google_auth_component/btn_google_auth_component_widget.dart';
import '/index.dart';
import 'auth_flow_widget.dart' show AuthFlowWidget;
import 'package:flutter/material.dart';

class AuthFlowModel extends FlutterFlowModel<AuthFlowWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for displayName_Create widget.
  FocusNode? displayNameCreateFocusNode;
  TextEditingController? displayNameCreateTextController;
  String? Function(BuildContext, String?)?
      displayNameCreateTextControllerValidator;
  String? _displayNameCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Display Name is required';
    }

    if (val.length < 3) {
      return 'Minimum 3 letters';
    }
    if (val.length > 32) {
      return 'frere';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Input a valid username';
    }
    return null;
  }

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  String? _emailAddressCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (val.length < 3) {
      return 'Please input valid mail';
    }
    if (val.length > 158) {
      return 'Maximum 158 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  // State field(s) for passwordConfirm_Create widget.
  FocusNode? passwordConfirmCreateFocusNode;
  TextEditingController? passwordConfirmCreateTextController;
  late bool passwordConfirmCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmCreateTextControllerValidator;
  // Model for BtnGoogleAuth_Component component.
  late BtnGoogleAuthComponentModel btnGoogleAuthComponentModel1;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Model for BtnGoogleAuth_Component component.
  late BtnGoogleAuthComponentModel btnGoogleAuthComponentModel2;

  @override
  void initState(BuildContext context) {
    displayNameCreateTextControllerValidator =
        _displayNameCreateTextControllerValidator;
    emailAddressCreateTextControllerValidator =
        _emailAddressCreateTextControllerValidator;
    passwordCreateVisibility = false;
    passwordConfirmCreateVisibility = false;
    btnGoogleAuthComponentModel1 =
        createModel(context, () => BtnGoogleAuthComponentModel());
    passwordVisibility = false;
    btnGoogleAuthComponentModel2 =
        createModel(context, () => BtnGoogleAuthComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    displayNameCreateFocusNode?.dispose();
    displayNameCreateTextController?.dispose();

    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    passwordConfirmCreateFocusNode?.dispose();
    passwordConfirmCreateTextController?.dispose();

    btnGoogleAuthComponentModel1.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    btnGoogleAuthComponentModel2.dispose();
  }
}
