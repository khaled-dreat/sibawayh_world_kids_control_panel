part of '../../../utils/import/app_import.dart';

class EditingWord extends StatefulWidget {
  static const String nameRoute = "EditingWord";
  final bool isEditing;
  final String? id;
  final String educType;
  final String lang;
  final String exampleType;
  const EditingWord({
    Key? key,
    this.isEditing = true,
    this.id,
    required this.educType,
    required this.lang,
    required this.exampleType,
  }) : super(key: key);

  @override
  State<EditingWord> createState() => _EditingWordState();
}

class _EditingWordState extends State<EditingWord> {
  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      ControllerEducationalMaterialsManager pEducMaterial =
          Provider.of<ControllerEducationalMaterialsManager>(context,
              listen: false);
      pEducMaterial.getEducationalMaterials(
          id: widget.id!,
          educType: widget.educType,
          lang: widget.lang,
          exampleType: widget.exampleType);
    }
  }

  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoding = false;
  File? imageToDisplay;
  File? audioToPlay;
  bool isUplodeAudio = false;

  Future<void> pickFile({required FileType fileType}) async {
    try {
      setState(() {
        isLoding = true;
      });
      result = await FilePicker.platform
          .pickFiles(type: fileType, allowMultiple: false);
      if (result != null) {
        fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        if (fileType == FileType.image) {
          imageToDisplay = File(pickedfile!.path.toString());
        } else {
          audioToPlay = File(pickedfile!.path.toString());
          isUplodeAudio = true;
        }
      }
      setState(() {
        isLoding = false;
      });
    } catch (e) {
      dev.log("Peicker Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    ControllerEducationalMaterialsManager pEducMaterial =
        Provider.of<ControllerEducationalMaterialsManager>(context);
    AudioPlayer player = AudioPlayer();

    return Scaffold(
      body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // title
              Padding(
                padding: EdgeInsets.only(top: 63.r),
                child: SizedBox(
                  width: 300.w,
                  child: CustomTextField(
                      hintText: widget.isEditing
                          ? ""
                          : "أكتب ما تريد ان يظهر للمستخدم"),
                ),
              ),
              20.verticalSpace,
              // add img
              InkWell(
                onTap: () {
                  pickFile(fileType: FileType.image);
                },
                child: Container(
                    width: 200.w,
                    height: 340.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: widget.isEditing
                              ? pEducMaterial.imgLoading
                                  ? Image.network(
                                      pEducMaterial.education!.image,
                                      fit: BoxFit.fill,
                                      width: 200.w,
                                      height: 350.h,
                                    )
                                  : AppLoading(
                                      loading: TypeLoading.image,
                                    )
                              : pickedfile != null
                                  ? Image.file(
                                      imageToDisplay!,
                                      fit: BoxFit.fill,
                                      width: 200.w,
                                      height: 350.h,
                                    )
                                  : pickedfile != null
                                      ? null
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
              20.verticalSpace,
              // * add Audio and play it
              // add Audio
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: 70.h,
                      width: 170.w,
                      child: InkWell(
                        onTap: () {
                          pickFile(fileType: FileType.audio);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              SvgPicture.asset(AppIcons.addSound, height: 35.h),
                              Text("تحميل صوت")
                            ],
                          ),
                        ),
                      )),
                  // play Audio
                  SizedBox(
                      height: 70.h,
                      width: 170.w,
                      child: InkWell(
                        onTap: () {
                          if (widget.isEditing) {
                            player.setUrl(pEducMaterial.education!.audio);
                            player.play();
                          } else {
                            if (!isUplodeAudio) {
                              AppToast.toast(
                                  "الرجاء تحميل صوت للمادة التعليمية");
                            }
                          }
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.playSound,
                                  height: 35.h),
                              Text("تشغيل الصوت")
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              20.verticalSpace,
              // Button of cancel an accept
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBtn(
                    icon: AppIcons.cancel,
                    colors: Colors.red,
                    title: "الغاء",
                    onTap: () {},
                  ),
                  CustomBtn(
                    icon: AppIcons.accept,
                    colors: Colors.green,
                    title: "حفظ",
                    onTap: () {
                      pEducMaterial.addEducationalMaterials(
                          title: ARWordsEnum.a.nameWords,
                          audio: audioToPlay!,
                          image: imageToDisplay!,
                          cardType: widget.exampleType,
                          woedsEnum: ARWordsEnum.b.nameWords,
                          educType: widget.educType,
                          exampleType: widget.exampleType,
                          lang: widget.lang);
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
