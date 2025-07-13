import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/organisme/note_displayer_s_m_widget/note_displayer_s_m_widget_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'main_notes_view_model.dart';
export 'main_notes_view_model.dart';

class MainNotesViewWidget extends StatefulWidget {
  const MainNotesViewWidget({super.key});

  @override
  State<MainNotesViewWidget> createState() => _MainNotesViewWidgetState();
}

class _MainNotesViewWidgetState extends State<MainNotesViewWidget>
    with TickerProviderStateMixin {
  late MainNotesViewModel _model;

  var hasNoteDisplayerSMWidgetTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainNotesViewModel());

    animationsMap.addAll({
      'staggeredViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 820.0.ms,
            duration: 350.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'noteDisplayerSMWidgetOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.1, 1.1),
          ),
        ],
      ),
      'noteDisplayerSMWidgetOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 150.0.ms,
            duration: 370.0.ms,
            begin: Offset(0.0, 42.0),
            end: Offset(-3.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                child: FutureBuilder<List<NotesRow>>(
                  future: NotesTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'author_user',
                      currentUserUid,
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
                    List<NotesRow> staggeredViewfNotesRowList = snapshot.data!;

                    return MasonryGridView.builder(
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 1;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 2;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 3;
                          } else {
                            return 4;
                          }
                        }(),
                      ),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      itemCount: staggeredViewfNotesRowList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, staggeredViewfIndex) {
                        final staggeredViewfNotesRow =
                            staggeredViewfNotesRowList[staggeredViewfIndex];
                        return wrapWithModel(
                          model: _model.noteDisplayerSMWidgetModels.getModel(
                            staggeredViewfNotesRow.id,
                            staggeredViewfIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: NoteDisplayerSMWidgetWidget(
                            key: Key(
                              'Keyux3_${staggeredViewfNotesRow.id}',
                            ),
                            noteToDisplayRef: staggeredViewfNotesRow.id,
                            refreshCallback: () async {
                              if (false == false) {
                                _model.filteredRowsCopy =
                                    await NotesTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'author_user',
                                    currentUserUid,
                                  ),
                                );
                                _model.qNotesResults = _model.filteredRowsCopy!
                                    .toList()
                                    .cast<NotesRow>();
                                safeSetState(() {});
                              } else {
                                _model.rowsCopy = await NotesTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'author_user',
                                    currentUserUid,
                                  ),
                                );
                                _model.qNotesResults =
                                    _model.rowsCopy!.toList().cast<NotesRow>();
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                          ),
                        )
                            .animateOnPageLoad(animationsMap[
                                'noteDisplayerSMWidgetOnPageLoadAnimation']!)
                            .animateOnActionTrigger(
                                animationsMap[
                                    'noteDisplayerSMWidgetOnActionTriggerAnimation']!,
                                hasBeenTriggered:
                                    hasNoteDisplayerSMWidgetTriggered);
                      },
                    ).animateOnPageLoad(
                        animationsMap['staggeredViewOnPageLoadAnimation']!);
                  },
                ),
              ),
            ),
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
