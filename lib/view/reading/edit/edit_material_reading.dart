part of '../../../utils/import/app_import.dart';

class EditMaterialReading extends StatefulWidget {
  static const String nameRoute = "EditingWord";
  final String? id;
  final String educType;
  final String exampleType;
  final String educLang;
  const EditMaterialReading({
    Key? key,
    this.id,
    required this.educType,
    required this.exampleType,
    required this.educLang,
  }) : super(key: key);

  @override
  State<EditMaterialReading> createState() => _EditMaterialReadingState();
}

class _EditMaterialReadingState extends State<EditMaterialReading> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  File? imageToDisplay;
  File? audioToPlay;
  bool isUplodeAudio = false;
  bool isUplodeimage = false;
  bool isSave = false;

  TextEditingController txtTitleController = TextEditingController();
  FocusNode txtTitleFocusNode = FocusNode();

  Future<void> pickFile({required FileType fileType}) async {
    try {
      result = await FilePicker.platform
          .pickFiles(type: fileType, allowMultiple: false);
      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        if (fileType == FileType.image) {
          imageToDisplay = File(pickedfile!.path.toString());
          isUplodeimage = true;
        } else {
          audioToPlay = File(pickedfile!.path.toString());
          isUplodeAudio = true;
        }
      }
      setState(() {});
    } catch (e) {
      dev.log("Peicker Error $e");
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ControllerEducationManeg pEducMaterial =
          Provider.of<ControllerEducationManeg>(context, listen: false);
      pEducMaterial.changeEducaLang(widget.educLang);
      pEducMaterial.getEducationByID(
          id: widget.id!,
          educType: widget.educType,
          exampleType: widget.exampleType);
    });
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
    txtTitleController.text = pEducMaterial.title;

    // ToDo : Refactor Wdgets
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.verticalSpace,
                // title
                TxtTitle(
                    txtTitleFocusNode: txtTitleFocusNode,
                    txtTitleController: txtTitleController),
                15.verticalSpace,
                //  DropDown Select Lang
                const DropDownSelectLang(),
                15.verticalSpace,
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
                                const Text("تحميل صوت")
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
                            if (!isUplodeAudio) {
                              player.setUrl(pEducMaterial.education!.audio);
                              player.play();
                            } else {
                              player.setFilePath(audioToPlay!.path.toString());
                              player.play();
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
                                Text("تشغيل الصوت")
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                15.verticalSpace,

                // add img
                InkWell(
                  onTap: () {
                    pickFile(fileType: FileType.image);
                  },
                  child: EditImg(
                      isUplodeimage: isUplodeimage,
                      imageToDisplay: imageToDisplay,
                      pEducMaterial: pEducMaterial),
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
                title: "تعديل",
                onTap: isSave
                    ? () {}
                    : () {
                        if (txtTitleController.text.isNotEmpty) {
                          AppDialog.saveEducData(
                            context,
                            btnOkOnPress: () {
                              setState(() {
                                isSave = true;
                              });

                              if (audioToPlay != null) {}
                              pEducMaterial.updateEducation(
                                cardID: widget.id!,
                                title: txtTitleController.text,
                                audio: audioToPlay,
                                image: imageToDisplay,
                                cardType: widget.exampleType,
                                educType: widget.educType,
                                exampleType: widget.exampleType,
                                context: context,
                              );
                            },
                            btnCancelOnPress: () {},
                          );
                        } else {
                          AppToast.toast("الرجاء أدخل وصف المقرر");
                          FocusScope.of(context)
                              .requestFocus(txtTitleFocusNode);
                        }
                      },
                child: isSave ? const CircularProgressIndicator() : null,
              ),
            ],
          )),
    );
  }
}
