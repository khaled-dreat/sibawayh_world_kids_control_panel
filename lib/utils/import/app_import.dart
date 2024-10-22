import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart' as loc;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_speech/google_speech.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibawayh_world_kids/utils/constant/app_images.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:uuid/uuid.dart';
import '../constant/app_icons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// ? **************** Show & AS ***********************
import 'dart:developer' as dev;
import 'package:validators/validators.dart' as validators;

//   **************** App Start ***********************
part '../../sibawayh_world_kids/app_start.dart';

// !  **************** View ***********************
part '../../view/home/body.dart';
part '../../view/curriculum_modification/body.dart';
part '../../view/edit_in/body.dart';
part '../../view/reading/words/body.dart';
part '../../view/reading/edit/edit_material_reading.dart';
part '../../view/auth/sign_in.dart';
part '../../view/auth/forgot_pass.dart';
part '../../view/auth/register.dart';
part '../../view/splash/body.dart';
part '../../view/selected_lang/body.dart';
part '../../view/auth/wrapper.dart';
part '../../view/reading/add/add_material_reading.dart';
part '../../view/reading/letters/body.dart';
part '../../view/reading/letters/tabs/ar/ar_list_viw_letters.dart';
part '../../view/reading/sentence/tabs/ar/ar_list_viw_sentence.dart';
part '../../view/reading/sentence/tabs/en/en_list_viw_sentence.dart';
part '../../view/reading/sentence/tabs/ar/tab_ar_sentence.dart';
part '../../view/reading/sentence/tabs/en/tab_en_sentence.dart';
part '../../view/reading/sentence/body.dart';

// ? **************** Utils ***********************
part '../routes/app_routes.dart';
part '../constant/app_lists.dart';
part '../constant/app_enum.dart';
part '../validators/app_validators.dart';
part '../theme/app_color.dart';
part '../theme/app_theme_choose.dart';
part '../theme/app_theme.dart';
part '../language/app_lang.dart';
part '../language/app_lang_key.dart';
part '../language/app_lang_config.dart';
part '../dime/app_dime.dart';
part '../../view/widgets/loading/app_loading.dart';
part '../../view/widgets/buttons/custom_auth_btn.dart';
part '../constant/app_firebase_key.dart';

//  **************** Wdgets ***********************
part '../../view/widgets/card/custom_card.dart';
part '../../view/widgets/buttons/custom_btn.dart';
part '../../view/widgets/tost/app_toast.dart';
part '../../view/auth/widgets/auth_app_bar.dart';
part '../../view/auth/widgets/auth_app_icon.dart';
part '../../view/auth/widgets/auth_field_email.dart';
part '../../view/auth/widgets/auth_field_pass.dart';
part '../../view/auth/widgets/auth_forgot_pass.dart';
part '../../view/auth/widgets/auth_footer.dart';
part '../../view/selected_lang/widgets/flag_lang.dart';
part '../../view/widgets/error/error_text.dart';
part '../../view/widgets/txt_forms/custom_text_field.dart';
part '../../view/widgets/appbars/custom_app.bar_srh.dart';
part '../../view/widgets/float_action_btn/cus_float_action_btn.dart';
part '../../view/widgets/educ_material_card/educ_material_card.dart';
part '../../view/widgets/dropdown/dropdown.dart';
part "../../view/widgets/snackbar/app_snackbar.dart";
part '../../view/widgets/dialog/app_dialog.dart';
part '../../view/reading/widgets/txt_title/txt_title.dart';
part '../../view/reading/edit/widgets/edit_img.dart';
part '../../view/reading/edit/widgets/btn_cancel_accept.dart';
part '../../view/reading/widgets/choose_en_ar/choose_en_ar.dart';
part '../../view/reading/words/tabs/ar/tab_ar_word.dart';
part '../../view/reading/words/tabs/ar/ar_list_viw_words.dart';
part '../../view/reading/words/tabs/en/en_list_viw_word.dart';
part '../../view/reading/words/tabs/en/tab_en_word.dart';
part '../../view/widgets/txt_forms/custom_text_form_srh.dart';
part '../../view/reading/letters/tabs/ar/tab_ar_letter.dart';
part '../../view/reading/letters/tabs/en/en_list_viw_letters.dart';
part '../../view/reading/letters/tabs/en/tab_en_letters.dart';

// ? **************** Controller ***********************
part '../../controller/c_pick.dart';
part '../../controller/c_auth.dart';

part '../../controller/education/c_educa_maneg.dart';
part '../../controller/c_srh.dart';

// * **************** Services ***********************
part '../../services/app_storeg_to_fire.dart';
part '../../controller/c_connectivity_manager.dart';

// ? **************** Model ***********************
part '../../model/education/m_education.dart';
part '../../model/auth/m_auth_user.dart';
part '../../model/education/m_all_words.dart';
part '../../model/education/m_all_letters.dart';
part '../../model/education/m_all_sentence.dart';
