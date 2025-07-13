import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/organisme/note_displayer_s_m_widget_copy_copy_copy/note_displayer_s_m_widget_copy_copy_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'side_notes_content_model.dart';
export 'side_notes_content_model.dart';

class SideNotesContentWidget extends StatefulWidget {
  const SideNotesContentWidget({super.key});

  @override
  State<SideNotesContentWidget> createState() => _SideNotesContentWidgetState();
}

class _SideNotesContentWidgetState extends State<SideNotesContentWidget> {
  late SideNotesContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNotesContentModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersRow>>(
      future: UsersTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
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
        List<UsersRow> containerUsersRowList = snapshot.data!;

        final containerUsersRow = containerUsersRowList.isNotEmpty
            ? containerUsersRowList.first
            : null;

        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 32.0, 10.0, 0.0),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Color(0x00000000),
                  child: ExpandableNotifier(
                    controller: _model.expandableExpandableController,
                    child: ExpandablePanel(
                      header: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 8.0, 12.0, 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Folder',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF14181B),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      collapsed: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                      ),
                      expanded: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              wrapWithModel(
                                model: _model
                                    .noteDisplayerSMWidgetCopyCopyCopyModel,
                                updateCallback: () => safeSetState(() {}),
                                child: NoteDisplayerSMWidgetCopyCopyCopyWidget(
                                  refreshCallback: () async {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: false,
                        tapBodyToCollapse: false,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
