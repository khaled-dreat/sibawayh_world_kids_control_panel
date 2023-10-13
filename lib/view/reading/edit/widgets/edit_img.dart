part of '../../../../utils/import/app_import.dart';

class EditImg extends StatelessWidget {
  const EditImg({
    super.key,
    required this.isUplodeimage,
    required this.imageToDisplay,
    required this.pEducMaterial,
  });

  final bool isUplodeimage;
  final File? imageToDisplay;
  final ControllerEducationManeg pEducMaterial;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310.w,
        height: 401.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: isUplodeimage
                    ? Image.file(
                        imageToDisplay!,
                        fit: BoxFit.fill,
                        width: 310.w,
                        height: 399.4.h,
                      )
                    : pEducMaterial.imgLoading
                        ? Image.network(
                            pEducMaterial.education!.image,
                            fit: BoxFit.fill,
                            width: 310.w,
                            height: 399.4.h,
                          )
                        : const AppLoading(
                            loading: TypeLoading.image,
                          )),
          ],
        ));
  }
}
