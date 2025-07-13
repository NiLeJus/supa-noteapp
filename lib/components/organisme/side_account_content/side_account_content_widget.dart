import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_menu_tile_component/side_menu_tile_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/work/edit_profile_modal/edit_profile_modal_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'side_account_content_model.dart';
export 'side_account_content_model.dart';

class SideAccountContentWidget extends StatefulWidget {
  const SideAccountContentWidget({super.key});

  @override
  State<SideAccountContentWidget> createState() =>
      _SideAccountContentWidgetState();
}

class _SideAccountContentWidgetState extends State<SideAccountContentWidget> {
  late SideAccountContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideAccountContentModel());

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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                containerUsersRow?.displayName,
                                'Error Fetching display name',
                              ),
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  containerUsersRow?.email,
                                  'error fetching user email',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF4B39EF),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
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
                Divider(
                  thickness: 1.0,
                  color: Color(0xFFE0E3E7),
                ),
                Builder(
                  builder: (context) => wrapWithModel(
                    model: _model.sideMenuTileComponentModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: SideMenuTileComponentWidget(
                      textToDisplay: 'My Account',
                      iconToDisplay: Icon(
                        Icons.person_sharp,
                      ),
                      actionToPerform: () async {
                        await showDialog(
                          barrierColor: Color(0x1F000000),
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: EditProfileModalWidget(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: Color(0xFFE0E3E7),
                ),
                wrapWithModel(
                  model: _model.sideMenuTileComponentModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: SideMenuTileComponentWidget(
                    textToDisplay: 'Log Out',
                    iconToDisplay: Icon(
                      Icons.logout_outlined,
                      color: Color(0xFFDF0009),
                    ),
                    actionToPerform: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth(
                          AuthFlowWidget.routeName, context.mounted);
                    },
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
