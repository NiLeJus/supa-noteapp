import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_bar_component_model.dart';
export 'search_bar_component_model.dart';

class SearchBarComponentWidget extends StatefulWidget {
  const SearchBarComponentWidget({super.key});

  @override
  State<SearchBarComponentWidget> createState() =>
      _SearchBarComponentWidgetState();
}

class _SearchBarComponentWidgetState extends State<SearchBarComponentWidget> {
  late SearchBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBarComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 110),
      curve: Curves.easeOut,
      width: 250.0,
      height: 40.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                  font: GoogleFonts.rubik(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodySmall.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(32.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(32.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).tertiary,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(32.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).tertiary,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(32.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            contentPadding:
                EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 12.0),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.rubik(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
