import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'explorepage_model.dart';
export 'explorepage_model.dart';

class ExplorepageWidget extends StatefulWidget {
  const ExplorepageWidget({Key? key}) : super(key: key);

  @override
  _ExplorepageWidgetState createState() => _ExplorepageWidgetState();
}

class _ExplorepageWidgetState extends State<ExplorepageWidget> {
  late ExplorepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExplorepageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(67.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).background,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Text(
                'Explore Schools that fit you!',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
            child: StreamBuilder<List<UniversitiesRecord>>(
              stream: queryUniversitiesRecord(
                singleRecord: true,
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
                          Color(0xFFE6585A),
                        ),
                      ),
                    ),
                  );
                }
                List<UniversitiesRecord> columnUniversitiesRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnUniversitiesRecord =
                    columnUniversitiesRecordList.isNotEmpty
                        ? columnUniversitiesRecordList.first
                        : null;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 388.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Baruch College',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final postlikedbyElement =
                                              currentUserReference;
                                          final postlikedbyUpdate =
                                              columnUniversitiesRecord!
                                                      .postlikedby
                                                      .contains(
                                                          postlikedbyElement)
                                                  ? FieldValue.arrayRemove(
                                                      [postlikedbyElement])
                                                  : FieldValue.arrayUnion(
                                                      [postlikedbyElement]);
                                          await columnUniversitiesRecord!
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'postlikedby':
                                                    postlikedbyUpdate,
                                              },
                                            ),
                                          });
                                        },
                                        value: columnUniversitiesRecord!
                                            .postlikedby
                                            .contains(currentUserReference),
                                        onIcon: Icon(
                                          Icons.favorite,
                                          color: Color(0xFFE6585A),
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 388.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Brown University',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final postlikedbyElement =
                                              currentUserReference;
                                          final postlikedbyUpdate =
                                              columnUniversitiesRecord!
                                                      .postlikedby
                                                      .contains(
                                                          postlikedbyElement)
                                                  ? FieldValue.arrayRemove(
                                                      [postlikedbyElement])
                                                  : FieldValue.arrayUnion(
                                                      [postlikedbyElement]);
                                          await columnUniversitiesRecord!
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'postlikedby':
                                                    postlikedbyUpdate,
                                              },
                                            ),
                                          });
                                        },
                                        value: columnUniversitiesRecord!
                                            .postlikedby
                                            .contains(currentUserReference),
                                        onIcon: Icon(
                                          Icons.favorite,
                                          color: Color(0xFFE6585A),
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 388.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Princeton University',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final postlikedbyElement =
                                              currentUserReference;
                                          final postlikedbyUpdate =
                                              columnUniversitiesRecord!
                                                      .postlikedby
                                                      .contains(
                                                          postlikedbyElement)
                                                  ? FieldValue.arrayRemove(
                                                      [postlikedbyElement])
                                                  : FieldValue.arrayUnion(
                                                      [postlikedbyElement]);
                                          await columnUniversitiesRecord!
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'postlikedby':
                                                    postlikedbyUpdate,
                                              },
                                            ),
                                          });
                                        },
                                        value: columnUniversitiesRecord!
                                            .postlikedby
                                            .contains(currentUserReference),
                                        onIcon: Icon(
                                          Icons.favorite,
                                          color: Color(0xFFE6585A),
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 388.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Texas A&M University',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final postlikedbyElement =
                                              currentUserReference;
                                          final postlikedbyUpdate =
                                              columnUniversitiesRecord!
                                                      .postlikedby
                                                      .contains(
                                                          postlikedbyElement)
                                                  ? FieldValue.arrayRemove(
                                                      [postlikedbyElement])
                                                  : FieldValue.arrayUnion(
                                                      [postlikedbyElement]);
                                          await columnUniversitiesRecord!
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'postlikedby':
                                                    postlikedbyUpdate,
                                              },
                                            ),
                                          });
                                        },
                                        value: columnUniversitiesRecord!
                                            .postlikedby
                                            .contains(currentUserReference),
                                        onIcon: Icon(
                                          Icons.favorite,
                                          color: Color(0xFFE6585A),
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 388.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Northwestern University',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final postlikedbyElement =
                                              currentUserReference;
                                          final postlikedbyUpdate =
                                              columnUniversitiesRecord!
                                                      .postlikedby
                                                      .contains(
                                                          postlikedbyElement)
                                                  ? FieldValue.arrayRemove(
                                                      [postlikedbyElement])
                                                  : FieldValue.arrayUnion(
                                                      [postlikedbyElement]);
                                          await columnUniversitiesRecord!
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'postlikedby':
                                                    postlikedbyUpdate,
                                              },
                                            ),
                                          });
                                        },
                                        value: columnUniversitiesRecord!
                                            .postlikedby
                                            .contains(currentUserReference),
                                        onIcon: Icon(
                                          Icons.favorite,
                                          color: Color(0xFFE6585A),
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 388.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Boston College',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: ToggleIcon(
                                        onPressed: () async {
                                          final postlikedbyElement =
                                              currentUserReference;
                                          final postlikedbyUpdate =
                                              columnUniversitiesRecord!
                                                      .postlikedby
                                                      .contains(
                                                          postlikedbyElement)
                                                  ? FieldValue.arrayRemove(
                                                      [postlikedbyElement])
                                                  : FieldValue.arrayUnion(
                                                      [postlikedbyElement]);
                                          await columnUniversitiesRecord!
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'postlikedby':
                                                    postlikedbyUpdate,
                                              },
                                            ),
                                          });
                                        },
                                        value: columnUniversitiesRecord!
                                            .postlikedby
                                            .contains(currentUserReference),
                                        onIcon: Icon(
                                          Icons.favorite,
                                          color: Color(0xFFE6585A),
                                          size: 25.0,
                                        ),
                                        offIcon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
