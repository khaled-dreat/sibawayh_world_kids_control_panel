part of '../../../utils/import/app_import.dart';

class EducMaterialCard extends StatelessWidget {
  const EducMaterialCard({
    super.key,
    required this.data,
    this.onTap,
  });
  final ModelEducation? data;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.r),
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
                padding: EdgeInsets.all(20.r),
                child: Text(data!.title, style: TextStyle(fontSize: 25.sp)),
              ),
              Row(
                children: [
                  data!.active
                      ? const Icon(Icons.visibility_off, color: Colors.red)
                      : const Icon(Icons.remove_red_eye, color: Colors.green),
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
