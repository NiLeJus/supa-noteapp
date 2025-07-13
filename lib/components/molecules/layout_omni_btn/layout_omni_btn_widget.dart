import '/backend/schema/enums/enums.dart';
import '/components/layout_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layout_omni_btn_model.dart';
export 'layout_omni_btn_model.dart';

class LayoutOmniBtnWidget extends StatefulWidget {
  const LayoutOmniBtnWidget({
    super.key,
    required this.iconToDisplay,
    required this.switchLayoutTarget,
    bool? isBehaviorInverted,
  }) : this.isBehaviorInverted = isBehaviorInverted ?? false;

  final Widget? iconToDisplay;
  final ELayoutTypes? switchLayoutTarget;

  /// Determine if the behavior of the button is as follow : Clicking switch to
  /// another state not the displayed on it
  final bool isBehaviorInverted;

  @override
  State<LayoutOmniBtnWidget> createState() => _LayoutOmniBtnWidgetState();
}

class _LayoutOmniBtnWidgetState extends State<LayoutOmniBtnWidget> {
  late LayoutOmniBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LayoutOmniBtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        if (FFAppState().selectedLayout == ELayoutTypes.Row) {
          return Visibility(
            visible: responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                wrapWithModel(
                  model: _model.layoutBtnVerticalModel,
                  updateCallback: () => safeSetState(() {}),
                  child: LayoutBtnWidget(
                    iconToDisplay: Icon(
                      Icons.calendar_view_day_outlined,
                    ),
                    switchLayoutTarget: ELayoutTypes.Vertical,
                    isBehaviorInverted: false,
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          );
        } else if (FFAppState().selectedLayout == ELayoutTypes.Stagered) {
          return wrapWithModel(
            model: _model.layoutBtnHorizontalModel,
            updateCallback: () => safeSetState(() {}),
            child: LayoutBtnWidget(
              iconToDisplay: Icon(
                Icons.calendar_view_week,
              ),
              switchLayoutTarget: ELayoutTypes.Row,
              isBehaviorInverted: false,
            ),
          );
        } else {
          return wrapWithModel(
            model: _model.layoutBtnStageredModel,
            updateCallback: () => safeSetState(() {}),
            child: LayoutBtnWidget(
              iconToDisplay: Icon(
                Icons.calendar_view_month_sharp,
              ),
              switchLayoutTarget: ELayoutTypes.Stagered,
              isBehaviorInverted: false,
            ),
          );
        }
      },
    );
  }
}
