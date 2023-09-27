part of '../../utils/import/app_import.dart';

class CurriculumModification extends StatelessWidget {
  static const String nameRoute = "CurriculumModification";

  const CurriculumModification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 50.r),
        child: Container(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10, // vertical
              crossAxisSpacing: 20, // horizontal
            ),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 50,
                width: 50,
                child: CustomCard(
                  icon: iconsCurrModifi.elementAt(index),
                  title: cardNameCurrModifi.elementAt(index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
