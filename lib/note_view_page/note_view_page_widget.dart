import '/backend/supabase/supabase.dart';
import '/components/molecules/neuro_btn/neuro_btn_widget.dart';
import '/components/molecules/note_tags_component/note_tags_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_view_page_model.dart';
export 'note_view_page_model.dart';

class NoteViewPageWidget extends StatefulWidget {
  const NoteViewPageWidget({
    super.key,
    required this.noteUID,
  });

  final String? noteUID;

  static String routeName = 'NoteView_Page';
  static String routePath = '/noteViewPage';

  @override
  State<NoteViewPageWidget> createState() => _NoteViewPageWidgetState();
}

class _NoteViewPageWidgetState extends State<NoteViewPageWidget> {
  late NoteViewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteViewPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: FutureBuilder<List<NotesRow>>(
                  future: NotesTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      widget.noteUID,
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
                    List<NotesRow> containerNotesRowList = snapshot.data!;

                    final containerNotesRow = containerNotesRowList.isNotEmpty
                        ? containerNotesRowList.first
                        : null;

                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 32.0, 16.0, 32.0),
                          child: Container(
                            width: 750.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: Stack(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          StickyHeader(
                                            overlapHeaders: false,
                                            header: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    Color(0x63FFFFFF)
                                                  ],
                                                  stops: [0.0, 0.5, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerNotesRow
                                                                ?.title,
                                                            'Error',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .robotoCondensed(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Flexible(
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.safePop();
                                                            },
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .neuroBtnCancelModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  NeuroBtnWidget(
                                                                iconToDisplay:
                                                                    Icon(
                                                                  Icons.close,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  18.0,
                                                                  0.0,
                                                                  18.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final tags =
                                                              containerNotesRow
                                                                      ?.tags
                                                                      .toList() ??
                                                                  [];

                                                          return Wrap(
                                                            spacing: 10.0,
                                                            runSpacing: 10.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children:
                                                                List.generate(
                                                                    tags.length,
                                                                    (tagsIndex) {
                                                              final tagsItem =
                                                                  tags[
                                                                      tagsIndex];
                                                              return wrapWithModel(
                                                                model: _model
                                                                    .noteTagsComponentModels
                                                                    .getModel(
                                                                  tagsItem,
                                                                  tagsIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    NoteTagsComponentWidget(
                                                                  key: Key(
                                                                    'Keyv8a_${tagsItem}',
                                                                  ),
                                                                  tagsToDisplay:
                                                                      tagsItem,
                                                                  deleteSelfCallback:
                                                                      () async {},
                                                                ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            content: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 18.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: MarkdownBody(
                                                      data: containerNotesRow!
                                                          .body!,
                                                      selectable: true,
                                                      onTapLink: (_, url, __) =>
                                                          launchURL(url!),
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
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 110.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0x00FFFFFF),
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.0, -1.0),
                                        end: AlignmentDirectional(0, 1.0),
                                      ),
                                    ),
                                    child: Wrap(
                                      spacing: 20.0,
                                      runSpacing: 5.0,
                                      alignment: WrapAlignment.end,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.up,
                                      clipBehavior: Clip.none,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Are you sure ?'),
                                                          content: Text(
                                                              'This will delete permanently the note'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Delete'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              await NotesTable().delete(
                                                matchingRows: (rows) =>
                                                    rows.eqOrNull(
                                                  'id',
                                                  widget.noteUID,
                                                ),
                                              );

                                              context.pushNamed(
                                                  HomePageWidget.routeName);
                                            }
                                          },
                                          child: wrapWithModel(
                                            model: _model.neuroBtnModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: NeuroBtnWidget(
                                              iconToDisplay: Icon(
                                                Icons.delete,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                              ),
                                              btnColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              TakingNotePageWidget.routeName,
                                              queryParameters: {
                                                'isNewNote': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                                'noteUIDToLoad': serializeParam(
                                                  widget.noteUID,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: wrapWithModel(
                                            model: _model.neuroBtnModifyModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: NeuroBtnWidget(
                                              iconToDisplay: Icon(
                                                Icons.mode,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              btnColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
