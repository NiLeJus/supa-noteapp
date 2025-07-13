import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'btn_google_auth_component_model.dart';
export 'btn_google_auth_component_model.dart';

class BtnGoogleAuthComponentWidget extends StatefulWidget {
  const BtnGoogleAuthComponentWidget({super.key});

  @override
  State<BtnGoogleAuthComponentWidget> createState() =>
      _BtnGoogleAuthComponentWidgetState();
}

class _BtnGoogleAuthComponentWidgetState
    extends State<BtnGoogleAuthComponentWidget> {
  late BtnGoogleAuthComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BtnGoogleAuthComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: FFButtonWidget(
        onPressed: () {
          print('Button pressed ...');
        },
        text: 'Continue with Google',
        icon: FaIcon(
          FontAwesomeIcons.google,
          size: 20.0,
        ),
        options: FFButtonOptions(
          width: 230.0,
          height: 44.0,
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).secondaryBackground,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.rubik(
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
          elevation: 0.0,
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).secondaryText,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(40.0),
          hoverColor: FlutterFlowTheme.of(context).primaryBackground,
        ),
      ),
    );
  }
}
