import '/components/layout_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'layout_omni_btn_widget.dart' show LayoutOmniBtnWidget;
import 'package:flutter/material.dart';

class LayoutOmniBtnModel extends FlutterFlowModel<LayoutOmniBtnWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Layout_Btn_Vertical.
  late LayoutBtnModel layoutBtnVerticalModel;
  // Model for Layout_Btn_Horizontal.
  late LayoutBtnModel layoutBtnHorizontalModel;
  // Model for Layout_Btn_Stagered.
  late LayoutBtnModel layoutBtnStageredModel;

  @override
  void initState(BuildContext context) {
    layoutBtnVerticalModel = createModel(context, () => LayoutBtnModel());
    layoutBtnHorizontalModel = createModel(context, () => LayoutBtnModel());
    layoutBtnStageredModel = createModel(context, () => LayoutBtnModel());
  }

  @override
  void dispose() {
    layoutBtnVerticalModel.dispose();
    layoutBtnHorizontalModel.dispose();
    layoutBtnStageredModel.dispose();
  }
}
