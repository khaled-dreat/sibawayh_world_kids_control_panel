part of '../../../utils/import/app_import.dart';

class EducMaterialCard extends StatelessWidget {
  const EducMaterialCard({
    super.key,
    required this.data,
    this.onTap,
  });
  final QueryDocumentSnapshot<Object?>? data;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 9.r),
      height: 65.h,
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 5,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.r),
                child: Text(data![AppFirebaseKey.title],
                    style: TextStyle(fontSize: 25.sp)),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        ControllerWordManeg pEduca =
                            Provider.of<ControllerWordManeg>(context,
                                listen: false);
                        pEduca.deleteWord(
                          audio: data![AppFirebaseKey.audio],
                          image: data![AppFirebaseKey.image],
                          title: data![AppFirebaseKey.title],
                          educType: data![AppFirebaseKey.educType],
                          exampleType: data![AppFirebaseKey.exampleType],
                          id: data![AppFirebaseKey.id],
                        );
                        AppSnackBar.snackBarSuccess(context,
                            msg: "تمت عملية الحذف بنجاح");
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 28.r,
                      )),
                  10.horizontalSpace,
                  Icon(
                    Icons.chevron_right,
                    size: 40.r,
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
