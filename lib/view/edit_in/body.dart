part of '../../utils/import/app_import.dart';

class EditIn extends StatelessWidget {
  static const String nameRoute = "EditIn";
  const EditIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 50.r),
        child: Container(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2, // vertical
              crossAxisSpacing: 10, // horizontal
            ),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(
                icon: editInIcons.elementAt(index),
                title: editInCardName.elementAt(index),
              );
            },
          ),
        ),
      ),
    );
  }
}
