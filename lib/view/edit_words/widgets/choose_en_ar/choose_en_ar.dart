part of '../../../../utils/import/app_import.dart';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  MyCustomWidgetState createState() => MyCustomWidgetState();
}

class MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {},
            child: Container(
              width: 100,
              height: 50,
              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
              decoration: BoxDecoration(
                color: isChecked ? Colors.green : Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(99),
                ),
                boxShadow: [
                  BoxShadow(
                    color: isChecked
                        ? Colors.green.withOpacity(0.6)
                        : Colors.red.withOpacity(0.6),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
