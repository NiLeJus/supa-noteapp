import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'neuro_btn_model.dart';
export 'neuro_btn_model.dart';

class NeuroBtnWidget extends StatefulWidget {
  const NeuroBtnWidget({
    super.key,
    required this.iconToDisplay,
    Color? btnColor,
  }) : this.btnColor = btnColor ?? const Color(0xFF8CC7FF);

  /// Icon that will be shown on the button
  final Widget? iconToDisplay;

  final Color btnColor;

  @override
  State<NeuroBtnWidget> createState() => _NeuroBtnWidgetState();
}

class _NeuroBtnWidgetState extends State<NeuroBtnWidget> {
  late NeuroBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NeuroBtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0xA1DBE2FF),
              offset: Offset(
                -3.0,
                -3.0,
              ),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  2.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 420),
            curve: Curves.easeIn,
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).secondaryBackground,
                  FlutterFlowTheme.of(context).primaryBackground
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: widget.iconToDisplay!,
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        _model.isHovered = true;
        safeSetState(() {});
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
        _model.isHovered = false;
        safeSetState(() {});
      }),
    );
  }
}
