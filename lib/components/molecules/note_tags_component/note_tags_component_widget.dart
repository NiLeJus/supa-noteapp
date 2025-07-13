import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_tags_component_model.dart';
export 'note_tags_component_model.dart';

class NoteTagsComponentWidget extends StatefulWidget {
  const NoteTagsComponentWidget({
    super.key,
    required this.tagsToDisplay,
    bool? isDeletable,
    this.deleteSelfCallback,
  }) : this.isDeletable = isDeletable ?? false;

  final String? tagsToDisplay;
  final bool isDeletable;
  final Future Function()? deleteSelfCallback;

  @override
  State<NoteTagsComponentWidget> createState() =>
      _NoteTagsComponentWidgetState();
}

class _NoteTagsComponentWidgetState extends State<NoteTagsComponentWidget> {
  late NoteTagsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteTagsComponentModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Color(0x66657AB8),
                offset: Offset(
                  -1.0,
                  -1.0,
                ),
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x0E000000),
                  offset: Offset(
                    1.0,
                    1.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.isDeletable) {
                  await widget.deleteSelfCallback?.call();
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 330),
                curve: Curves.easeIn,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    () {
                      if (!widget.isDeletable) {
                        return FlutterFlowTheme.of(context).primaryBackground;
                      } else if (_model.mouseRegionHovered) {
                        return FlutterFlowTheme.of(context).error;
                      } else {
                        return FlutterFlowTheme.of(context).primaryBackground;
                      }
                    }(),
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  child: Text(
                    valueOrDefault<String>(
                      () {
                        if (!widget.isDeletable) {
                          return widget.tagsToDisplay;
                        } else if (_model.mouseRegionHovered) {
                          return 'delete';
                        } else {
                          return widget.tagsToDisplay;
                        }
                      }(),
                      'error',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            () {
                              if (!widget.isDeletable) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryText;
                              } else if (_model.mouseRegionHovered) {
                                return FlutterFlowTheme.of(context)
                                    .secondaryBackground;
                              } else {
                                return FlutterFlowTheme.of(context)
                                    .secondaryText;
                              }
                            }(),
                            FlutterFlowTheme.of(context).secondaryText,
                          ),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
        }),
      ),
    );
  }
}
