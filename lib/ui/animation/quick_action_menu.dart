import 'package:flutter/material.dart';
import 'package:medication_book/configs/theme.dart';
import 'package:medication_book/ui/screen/add_presc/add_presc_screen.dart';
import 'package:medication_book/ui/screen/scanning/scanning_screen.dart';
import 'package:medication_book/ui/widgets/cards.dart';

class QuickActionMenu extends StatefulWidget {
  @override
  _QuickActionMenuState createState() => _QuickActionMenuState();
}

class _QuickActionMenuState extends State<QuickActionMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.ease);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Container(
        width: MediaQuery.of(context).size.width*0.7,
        decoration: BoxDecoration(
          color: ColorPalette.white.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              ItemAction(
                image: 'assets/image/medicineIcon.png',
                title: "Presc",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPrescScreen()));
                },
              ),
              ItemAction(
                image: 'assets/image/cameraIcon.png',
                title: "Scan bill",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scanning()));
                },
              ),
              // ItemAction(
              //     image: 'assets/image/noteIcon.png',
              //     title: "Note",
              //     onTap: () {}),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
    );
  }
}

class ItemAction extends StatefulWidget {
  final String image;
  final String title;
  final Function onTap;

  ItemAction({this.image, this.title, this.onTap});

  @override
  _ItemActionState createState() => _ItemActionState();
}

class _ItemActionState extends State<ItemAction> {
  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        color: ColorPalette.white,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(15.0),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage(widget.image),
                      width: 60,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: ColorPalette.darkerGrey,
                        fontWeight: FontWeight.w300,
                        fontSize: 14
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
