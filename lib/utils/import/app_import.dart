import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ? **************** Show & AS ***********************
import 'dart:developer' as dev;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sibawayh_world_kids/utils/constant/enum_word.dart';
import 'package:uuid/uuid.dart';

import '../constant/app_icons.dart';

//   **************** App Start ***********************
part '../../sibawayh_world_kids/app_start.dart';

// !  **************** View ***********************
part '../../view/home/body.dart';
part '../../view/curriculum_modification/body.dart';
part '../../view/edit_in/body.dart';
part '../../view/edit_words/body.dart';
part '../../view/editing_word/body.dart';

// ? **************** Utils ***********************
part '../routes/app_routes.dart';
part '../constant/app_lists.dart';
//  **************** Wdgets ***********************
part '../../view/widgets/card/custom_card.dart';
part '../../view/edit_words/widgets/list_view_builder/list_viw_build_edit_words.dart';
part '../../view/widgets/buttuns/custom_btn.dart';
part '../../view/widgets/tost/app_toast.dart';

// ? **************** Controller ***********************
part '../../controller/c_pick.dart';
part '../../controller/c_editing.dart';

// * **************** Services ***********************
part '../../services/app_storeg_to_fire.dart';

// ? **************** Model ***********************
part '../../model/m_education.dart';
