import '/backend/supabase/supabase.dart';
import '/components/molecules/note_tags_component/note_tags_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_displayer_s_m_widget_copy_copy_model.dart';
export 'note_displayer_s_m_widget_copy_copy_model.dart';

class NoteDisplayerSMWidgetCopyCopyWidget extends StatefulWidget {
  const NoteDisplayerSMWidgetCopyCopyWidget({
    super.key,
    this.noteToDisplayRef,
    required this.refreshCallback,
  });

  final int? noteToDisplayRef;
  final Future Function()? refreshCallback;

  @override
  State<NoteDisplayerSMWidgetCopyCopyWidget> createState() =>
      _NoteDisplayerSMWidgetCopyCopyWidgetState();
}

class _NoteDisplayerSMWidgetCopyCopyWidgetState
    extends State<NoteDisplayerSMWidgetCopyCopyWidget> {
  late NoteDisplayerSMWidgetCopyCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteDisplayerSMWidgetCopyCopyModel());

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
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 180.0,
                  maxWidth: 180.0,
                  maxHeight: 380.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: valueOrDefault<double>(
                      random_data.randomInteger(180, 230).toDouble(),
                      180.0,
                    ),
                    height: 380.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 8.0, 10.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              noteCtnNotesRow?.title,
                                              'Error Getting Title',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF14181B),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            dateTimeFormat("relative",
                                                noteCtnNotesRow!.createdAt),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
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
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Builder(
                                    builder: (context) {
                                      final tagsList =
                                          noteCtnNotesRow.tags.toList() ?? [];

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(tagsList.length,
                                            (tagsListIndex) {
                                          final tagsListItem =
                                              tagsList[tagsListIndex];
                                          return wrapWithModel(
                                            model: _model
                                                .noteTagsComponentModels
                                                .getModel(
                                              tagsListItem,
                                              tagsListIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: NoteTagsComponentWidget(
                                              key: Key(
                                                'Key3ww_${tagsListItem}',
                                              ),
                                              tagsToDisplay: tagsListItem,
                                              isDeletable: false,
                                              deleteSelfCallback: () async {},
                                            ),
                                          );
                                        }).divide(SizedBox(height: 3.0)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
