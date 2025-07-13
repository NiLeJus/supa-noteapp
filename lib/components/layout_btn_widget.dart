import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'layout_btn_model.dart';
export 'layout_btn_model.dart';

class LayoutBtnWidget extends StatefulWidget {
  const LayoutBtnWidget({
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
  State<LayoutBtnWidget> createState() => _LayoutBtnWidgetState();
}

class _LayoutBtnWidgetState extends State<LayoutBtnWidget> {
  late LayoutBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LayoutBtnModel());

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

    return FlutterFlowIconButton(
      borderRadius: 8.0,
      buttonSize: 40.0,
      fillColor: valueOrDefault<Color>(
        widget.switchLayoutTarget == FFAppState().selectedLayout
            ? Color(0xFFA99FFB)
            : FlutterFlowTheme.of(context).secondaryBackground,
        FlutterFlowTheme.of(context).secondaryBackground,
      ),
      icon: widget.iconToDisplay!,
      onPressed: () async {
        if (widget.isBehaviorInverted) {
          FFAppState().selectedLayout = widget.switchLayoutTarget;
          safeSetState(() {});
        } else {
          FFAppState().selectedLayout = widget.switchLayoutTarget;
          safeSetState(() {});
        }
      },
    );
  }
}
