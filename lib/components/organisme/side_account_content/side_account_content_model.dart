import '/components/side_menu_tile_component/side_menu_tile_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_account_content_widget.dart' show SideAccountContentWidget;
import 'package:flutter/material.dart';

class SideAccountContentModel
    extends FlutterFlowModel<SideAccountContentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SideMenuTile_Component component.
  late SideMenuTileComponentModel sideMenuTileComponentModel1;
  // Model for SideMenuTile_Component component.
  late SideMenuTileComponentModel sideMenuTileComponentModel2;

  @override
  void initState(BuildContext context) {
    sideMenuTileComponentModel1 =
        createModel(context, () => SideMenuTileComponentModel());
    sideMenuTileComponentModel2 =
        createModel(context, () => SideMenuTileComponentModel());
  }

  @override
  void dispose() {
    sideMenuTileComponentModel1.dispose();
    sideMenuTileComponentModel2.dispose();
  }
}
