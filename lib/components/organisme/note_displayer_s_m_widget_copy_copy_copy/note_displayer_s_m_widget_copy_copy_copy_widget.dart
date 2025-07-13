import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_displayer_s_m_widget_copy_copy_copy_model.dart';
export 'note_displayer_s_m_widget_copy_copy_copy_model.dart';

class NoteDisplayerSMWidgetCopyCopyCopyWidget extends StatefulWidget {
  const NoteDisplayerSMWidgetCopyCopyCopyWidget({
    super.key,
    this.noteToDisplayRef,
    required this.refreshCallback,
  });

  final int? noteToDisplayRef;
  final Future Function()? refreshCallback;

  @override
  State<NoteDisplayerSMWidgetCopyCopyCopyWidget> createState() =>
      _NoteDisplayerSMWidgetCopyCopyCopyWidgetState();
}

class _NoteDisplayerSMWidgetCopyCopyCopyWidgetState
    extends State<NoteDisplayerSMWidgetCopyCopyCopyWidget> {
  late NoteDisplayerSMWidgetCopyCopyCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => NoteDisplayerSMWidgetCopyCopyCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NotesRow>>(
      future: NotesTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.noteToDisplayRef?.toString(),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).secondary,
                ),
              ),
            ),
          );
        }
        List<NotesRow> noteCtnNotesRowList = snapshot.data!;

        final noteCtnNotesRow =
            noteCtnNotesRowList.isNotEmpty ? noteCtnNotesRowList.first : null;

        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pushNamed(
              NoteViewPageWidget.routeName,
              queryParameters: {
                'noteUID': serializeParam(
                  widget.noteToDisplayRef?.toString(),
                  ParamType.String,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.leftToRight,
                ),
              },
            );
          },
          child: Material(
            color: Colors.transparent,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              noteCtnNotesRow?.title,
                              'Error Getting Title',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF5A6E85),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                          ),
                          Text(
                            dateTimeFormat(
                                "relative", noteCtnNotesRow!.createdAt),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  color: Color(0xFF7E7E7E),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
