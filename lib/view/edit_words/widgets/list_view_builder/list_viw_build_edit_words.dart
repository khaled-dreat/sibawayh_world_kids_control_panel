part of '../../../../utils/import/app_import.dart';

class ListViwBuildEditWords extends StatelessWidget {
  const ListViwBuildEditWords({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20.r),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 7.r),
          height: 65.h,
          child: Card(
            elevation: 5,
            child: Center(
              child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: const Text("ألف"),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 40.r,
                  )),
            ),
          ),
        );
      },
    );
  }
}
