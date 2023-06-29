import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/widget/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class homedetailpage extends StatelessWidget {
  final Item catelog;

  const homedetailpage({super.key, required this.catelog})
      : assert(catelog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: mytheme.creamcolor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catelog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(mytheme.darkbluishcolor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "BUY".text.make())
                .wh(100, 50)
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: catelog.id.toString(),
                    child: Image.network(catelog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catelog.name.text.xl4
                          .color(mytheme.darkbluishcolor)
                          .bold
                          .make(),
                      catelog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                    ],
                  ).p64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
