import '/components/layout_btn_widget.dart';
import '/components/molecules/layout_omni_btn/layout_omni_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'actions_on_layout_component_widget.dart'
    show ActionsOnLayoutComponentWidget;
import 'package:flutter/material.dart';

class ActionsOnLayoutComponentModel
    extends FlutterFlowModel<ActionsOnLayoutComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Layout_Btn_Vertical.
  late LayoutBtnModel layoutBtnVerticalModel;
  // Model for Layout_Btn_Horizontal.
  late LayoutBtnModel layoutBtnHorizontalModel;
  // Model for Layout_Btn_Stagered.
  late LayoutBtnModel layoutBtnStageredModel;
  // Model for LayoutOmni_Btn component.
  late LayoutOmniBtnModel layoutOmniBtnModel;

  @override
  void initState(BuildContext context) {
    layoutBtnVerticalModel = createModel(context, () => LayoutBtnModel());
    layoutBtnHorizontalModel = createModel(context, () => LayoutBtnModel());
    layoutBtnStageredModel = createModel(context, () => LayoutBtnModel());
    layoutOmniBtnModel = createModel(context, () => LayoutOmniBtnModel());
  }

  @override
  void dispose() {
    layoutBtnVerticalModel.dispose();
    layoutBtnHorizontalModel.dispose();
    layoutBtnStageredModel.dispose();
    layoutOmniBtnModel.dispose();
  }
}
