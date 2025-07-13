import '/backend/schema/enums/enums.dart';
import '/components/layout_btn_widget.dart';
import '/components/molecules/layout_omni_btn/layout_omni_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'actions_on_layout_component_model.dart';
export 'actions_on_layout_component_model.dart';

class ActionsOnLayoutComponentWidget extends StatefulWidget {
  const ActionsOnLayoutComponentWidget({super.key});

  @override
  State<ActionsOnLayoutComponentWidget> createState() =>
      _ActionsOnLayoutComponentWidgetState();
}

class _ActionsOnLayoutComponentWidgetState
    extends State<ActionsOnLayoutComponentWidget> {
  late ActionsOnLayoutComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionsOnLayoutComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          tabletLandscape: false,
        ))
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              wrapWithModel(
                model: _model.layoutBtnVerticalModel,
                updateCallback: () => safeSetState(() {}),
                child: LayoutBtnWidget(
                  iconToDisplay: Icon(
                    Icons.calendar_view_day_outlined,
                  ),
                  switchLayoutTarget: ELayoutTypes.Vertical,
                  isBehaviorInverted: false,
                ),
              ),
              wrapWithModel(
                model: _model.layoutBtnHorizontalModel,
                updateCallback: () => safeSetState(() {}),
                child: LayoutBtnWidget(
                  iconToDisplay: Icon(
                    Icons.calendar_view_week,
                  ),
                  switchLayoutTarget: ELayoutTypes.Row,
                ),
              ),
              wrapWithModel(
                model: _model.layoutBtnStageredModel,
                updateCallback: () => safeSetState(() {}),
                child: LayoutBtnWidget(
                  iconToDisplay: Icon(
                    Icons.calendar_view_month_sharp,
                  ),
                  switchLayoutTarget: ELayoutTypes.Stagered,
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        if (responsiveVisibility(
          context: context,
          desktop: false,
        ))
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.layoutOmniBtnModel,
                updateCallback: () => safeSetState(() {}),
                child: LayoutOmniBtnWidget(
                  iconToDisplay: Icon(
                    Icons.sixteen_mp_sharp,
                  ),
                  isBehaviorInverted: true,
                  switchLayoutTarget: ELayoutTypes.Row,
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
      ],
    );
  }
}
