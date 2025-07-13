import '/backend/supabase/supabase.dart';
import '/components/molecules/neuro_btn/neuro_btn_widget.dart';
import '/components/molecules/note_tags_component/note_tags_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_displayer_s_m_widget_model.dart';
export 'note_displayer_s_m_widget_model.dart';

class NoteDisplayerSMWidgetWidget extends StatefulWidget {
  const NoteDisplayerSMWidgetWidget({
    super.key,
    required this.noteToDisplayRef,
    required this.refreshCallback,
  });

  final String? noteToDisplayRef;
  final Future Function()? refreshCallback;

  @override
  State<NoteDisplayerSMWidgetWidget> createState() =>
      _NoteDisplayerSMWidgetWidgetState();
}

class _NoteDisplayerSMWidgetWidgetState
    extends State<NoteDisplayerSMWidgetWidget> with TickerProviderStateMixin {
  late NoteDisplayerSMWidgetModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteDisplayerSMWidgetModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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
          widget.noteToDisplayRef,
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
                  widget.noteToDisplayRef,
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
                width: 280.0,
                constraints: BoxConstraints(
                  maxHeight: 380.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    height: 380.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final displayedTags =
                                            noteCtnNotesRow?.tags.toList() ??
                                                [];

                                        return Wrap(
                                          spacing: 10.0,
                                          runSpacing: 10.0,
                                          alignment: WrapAlignment.end,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: List.generate(
                                              displayedTags.length,
                                              (displayedTagsIndex) {
                                            final displayedTagsItem =
                                                displayedTags[
                                                    displayedTagsIndex];
                                            return wrapWithModel(
                                              model: _model
                                                  .noteTagsComponentModels
                                                  .getModel(
                                                displayedTagsItem,
                                                displayedTagsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: NoteTagsComponentWidget(
                                                key: Key(
                                                  'Keyb64_${displayedTagsItem}',
                                                ),
                                                tagsToDisplay:
                                                    displayedTagsItem,
                                                deleteSelfCallback: () async {},
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          noteCtnNotesRow?.title,
                                          'Error Getting Title',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF14181B),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
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
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: ClipRRect(
                                    child: Container(
                                      width: double.infinity,
                                      height: 250.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: MarkdownBody(
                                                  data: noteCtnNotesRow.body!,
                                                  selectable: false,
                                                  onTapLink: (_, url, __) =>
                                                      launchURL(url!),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('Delete'),
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
                                              widget.noteToDisplayRef,
                                            ),
                                          );
                                          await widget.refreshCallback?.call();
                                        }
                                      },
                                      child: wrapWithModel(
                                        model: _model.neuroBtnModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NeuroBtnWidget(
                                          iconToDisplay: Icon(
                                            Icons.delete,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                          ),
                                          btnColor: FlutterFlowTheme.of(context)
                                              .error,
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.neuroBtnModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: NeuroBtnWidget(
                                        iconToDisplay: Icon(
                                          Icons.mode,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                        btnColor: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          NoteViewPageWidget.routeName,
                                          queryParameters: {
                                            'noteUID': serializeParam(
                                              widget.noteToDisplayRef,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          },
                                        );
                                      },
                                      child: wrapWithModel(
                                        model: _model.neuroBtnModel3,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: NeuroBtnWidget(
                                          iconToDisplay: Icon(
                                            Icons.remove_red_eye,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          btnColor: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation']!),
                              ),
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
