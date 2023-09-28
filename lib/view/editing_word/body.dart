part of '../../utils/import/app_import.dart';

class EditingWord extends StatefulWidget {
  static const String nameRoute = "EditingWord";
  const EditingWord({super.key});

  @override
  State<EditingWord> createState() => _EditingWordState();
}

class _EditingWordState extends State<EditingWord> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoding = false;
  File? imageToDisplay;
  File? audioToPlay;

  /// *******************************************
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
        }
        // dev.log("File Name $imageToDisplay");
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
                      hintText: "أكتب ما تريد ان يظهر للمستخدم"),
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
                    height: 368.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: pickedfile != null
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
              // add Aoudio and play it
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
                  SizedBox(
                      height: 70.h,
                      width: 170.w,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.playSound, height: 35.h),
                            Text("تشغيل الصوت")
                          ],
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
                      dev.log(pickedfile!.path.toString());
                      pEducMaterial.addEducationalMaterials(
                          audio: audioToPlay!,
                          image: imageToDisplay!,
                          cardType: CardEnum.word.name,
                          wrorsEnum: WrorsEnum.b.nameWords);
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
