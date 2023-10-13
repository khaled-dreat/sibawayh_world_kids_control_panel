part of '../../../utils/import/app_import.dart';

class AddMaterialReading extends StatefulWidget {
  static const String nameRoute = "AddWord";
  final String educType;
  final String exampleType;
  const AddMaterialReading({
    Key? key,
    required this.educType,
    required this.exampleType,
  }) : super(key: key);

  @override
  State<AddMaterialReading> createState() => _AddMaterialReadingState();
}

class _AddMaterialReadingState extends State<AddMaterialReading> {
  TextEditingController txtTitleController = TextEditingController();
  FocusNode txtTitleFocusNode = FocusNode();

  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  File? imageToDisplay;
  File? audioToPlay;
  bool isUplodeAudio = false;
  bool isUplodeImage = false;
  bool isSave = false;

  Future<void> pickFile({required FileType fileType}) async {
    try {
      result = await FilePicker.platform
          .pickFiles(type: fileType, allowMultiple: false);
      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        if (fileType == FileType.image) {
          imageToDisplay = File(pickedfile!.path.toString());
          isUplodeImage = true;
        } else {
          audioToPlay = File(pickedfile!.path.toString());
          isUplodeAudio = true;
        }
        setState(() {});
      }
    } catch (e) {
      dev.log("Peicker Error $e");
    }
  }

  @override
  void dispose() {
    txtTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ControllerEducationManeg pEducMaterial =
        Provider.of<ControllerEducationManeg>(context);
    AudioPlayer player = AudioPlayer();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                20.verticalSpace,
                // title
                TxtTitle(
                    txtTitleFocusNode: txtTitleFocusNode,
                    txtTitleController: txtTitleController),
                15.verticalSpace,
                //  DropDown Select Lang
                const DropDownSelectLang(isEditing: false),
                15.verticalSpace,
                // * Add, Play Audio
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // add Audio
                    SizedBox(
                        height: 80.h,
                        width: 150.w,
                        child: InkWell(
                          onTap: () {
                            pickFile(fileType: FileType.audio);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.green.shade100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppIcons.addSound,
                                    height: 35.h),
                                Text(
                                  "تحميل صوت",
                                  style: TextStyle(fontSize: 15.sp),
                                )
                              ],
                            ),
                          ),
                        )),
                    // play Audio
                    SizedBox(
                        height: 80.h,
                        width: 150.w,
                        child: InkWell(
                          onTap: () {
                            if (isUplodeAudio) {
                              player.setFilePath(audioToPlay!.path.toString());
                              player.play();
                            } else {
                              AppToast.toast(
                                  "الرجاء تحميل صوت للمادة التعليمية");
                            }
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.green.shade100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppIcons.playSound,
                                    height: 35.h),
                                Text(
                                  "تشغيل الصوت",
                                  style: TextStyle(fontSize: 15.sp),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                15.verticalSpace,

                // add img
                InkWell(
                  onTap: () {
                    pickFile(fileType: FileType.image);
                  },
                  child: Container(
                      width: 310.w,
                      height: 401.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: isUplodeImage
                                ? Image.file(
                                    imageToDisplay!,
                                    fit: BoxFit.fill,
                                    width: 310.w,
                                    height: 399.4.h,
                                  )
                                : SizedBox(
                                    height: 70.h,
                                    child: SvgPicture.asset(
                                      AppIcons.addImag,
                                    ),
                                  ),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
      // Button of cancel an accept

      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomBtn(
              icon: AppIcons.cancel,
              colors: Colors.red,
              title: "الغاء",
              onTap: () {
                isSave ? null : Navigator.pop(context);
              },
            ),
            CustomBtn(
              icon: AppIcons.accept,
              colors: Colors.green,
              title: "حفظ",
              onTap: isSave
                  ? () {}
                  : () {
                      if (txtTitleController.text.isNotEmpty) {
                        if (isUplodeImage) {
                          if (isUplodeAudio) {
                            AppDialog.saveEducData(
                              context,
                              btnOkOnPress: () {
                                setState(() {
                                  isSave = true;
                                });

                                List<int> audioToText = pEducMaterial
                                    .convertAudioToList(audioToPlay!);

                                pEducMaterial.transcribe(audioToText, context);

                                pEducMaterial.addEducation(
                                  title: txtTitleController.text,
                                  audio: audioToPlay!,
                                  image: imageToDisplay!,
                                  cardType: widget.exampleType,
                                  educType: widget.educType,
                                  exampleType: widget.exampleType,
                                  context: context,
                                );
                              },
                              btnCancelOnPress: () {},
                            );
                          } else {
                            AppToast.toast("الرجاء أختر صوت للمقرر");
                          }
                        } else {
                          AppToast.toast("الرجاء أختر صورة للمقرر");
                        }
                      } else {
                        AppToast.toast("الرجاء أدخل وصف المقرر");
                        FocusScope.of(context).requestFocus(txtTitleFocusNode);
                      }
                    },
              child: isSave ? const CircularProgressIndicator() : null,
            ),
          ],
        ),
      ),
    );
  }
}
