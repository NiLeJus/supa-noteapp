import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mark_down_help_dialog_model.dart';
export 'mark_down_help_dialog_model.dart';

class MarkDownHelpDialogWidget extends StatefulWidget {
  const MarkDownHelpDialogWidget({super.key});

  @override
  State<MarkDownHelpDialogWidget> createState() =>
      _MarkDownHelpDialogWidgetState();
}

class _MarkDownHelpDialogWidgetState extends State<MarkDownHelpDialogWidget> {
  late MarkDownHelpDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarkDownHelpDialogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 350.0,
        maxHeight: 250.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 7.0,
            color: Color(0x2F1D2429),
            offset: Offset(
              0.0,
              3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Markdown for noobs',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.robotoCondensed(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: Color(0xFFC6BBFF),
            ),
            Flexible(
              child: Wrap(
                spacing: 0.0,
                runSpacing: 0.0,
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 460.0,
                      maxHeight: 277.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: MarkdownBody(
                        data:
                            '''# Header 1\n## Header 2\n### Header 3\n\n*This text will be italic*\n\n**This text will be bold**\n''',
                        selectable: true,
                        onTapLink: (_, url, __) => launchURL(url!),
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 460.0,
                      maxHeight: 277.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Text(
                      '# Header 1\n## Header 2\n### Header 3\n\n*This text will be italic*\n\n**This text will be bold**',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.rubik(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
