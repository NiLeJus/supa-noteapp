import '/backend/supabase/supabase.dart';
import '/components/molecules/neuro_btn/neuro_btn_widget.dart';
import '/components/molecules/note_tags_component/note_tags_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_view_widget_model.dart';
export 'note_view_widget_model.dart';

class NoteViewWidgetWidget extends StatefulWidget {
  const NoteViewWidgetWidget({
    super.key,
    required this.displayedNoteUID,
  });

  final int? displayedNoteUID;

  @override
  State<NoteViewWidgetWidget> createState() => _NoteViewWidgetWidgetState();
}

class _NoteViewWidgetWidgetState extends State<NoteViewWidgetWidget> {
  late NoteViewWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteViewWidgetModel());

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
          widget.displayedNoteUID?.toString(),
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

        return Material(
          color: Colors.transparent,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 16.0, 12.0, 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'The Running Ragamuffins',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              font: GoogleFonts.robotoCondensed(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final tagsToDisplay =
                                          noteCtnNotesRow?.tags.toList() ?? [];

                                      return Wrap(
                                        spacing: 10.0,
                                        runSpacing: 10.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children:
                                            List.generate(tagsToDisplay.length,
                                                (tagsToDisplayIndex) {
                                          final tagsToDisplayItem =
                                              tagsToDisplay[tagsToDisplayIndex];
                                          return wrapWithModel(
                                            model: _model
                                                .noteTagsComponentModels
                                                .getModel(
                                              tagsToDisplayIndex.toString(),
                                              tagsToDisplayIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: NoteTagsComponentWidget(
                                              key: Key(
                                                'Key7ac_${tagsToDisplayIndex.toString()}',
                                              ),
                                              tagsToDisplay: tagsToDisplayItem,
                                              deleteSelfCallback: () async {},
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          Flexible(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 16.0, 32.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: MarkdownBody(
                                                    data:
                                                        noteCtnNotesRow!.body!,
                                                    selectable: true,
                                                    onTapLink: (_, url, __) =>
                                                        launchURL(url!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 150.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0x00FFFFFF), Colors.white],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 28.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            wrapWithModel(
                              model: _model.neuroBtnModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: NeuroBtnWidget(
                                iconToDisplay: Icon(
                                  Icons.delete,
                                  color: FlutterFlowTheme.of(context).error,
                                ),
                                btnColor: FlutterFlowTheme.of(context).error,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.neuroBtnModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: NeuroBtnWidget(
                                iconToDisplay: Icon(
                                  Icons.mode,
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                                btnColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.neuroBtnModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: NeuroBtnWidget(
                                iconToDisplay: Icon(
                                  Icons.remove_red_eye,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                btnColor: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
