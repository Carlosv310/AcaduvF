import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'editprofile_widget.dart' show EditprofileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditprofileModel extends FlutterFlowModel<EditprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for newname widget.
  FocusNode? newnameFocusNode;
  TextEditingController? newnameController;
  String? Function(BuildContext, String?)? newnameControllerValidator;
  // State field(s) for newemail widget.
  FocusNode? newemailFocusNode;
  TextEditingController? newemailController;
  String? Function(BuildContext, String?)? newemailControllerValidator;
  // State field(s) for phoneupdate widget.
  FocusNode? phoneupdateFocusNode;
  TextEditingController? phoneupdateController;
  String? Function(BuildContext, String?)? phoneupdateControllerValidator;
  // State field(s) for gradeupdate widget.
  FocusNode? gradeupdateFocusNode;
  TextEditingController? gradeupdateController;
  String? Function(BuildContext, String?)? gradeupdateControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    newnameFocusNode?.dispose();
    newnameController?.dispose();

    newemailFocusNode?.dispose();
    newemailController?.dispose();

    phoneupdateFocusNode?.dispose();
    phoneupdateController?.dispose();

    gradeupdateFocusNode?.dispose();
    gradeupdateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
