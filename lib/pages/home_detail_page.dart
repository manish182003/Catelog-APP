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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catelog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.theme.focusColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(120, 50)
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catelog.name.text.xl4
                          .color(context.theme.hintColor)
                          .bold
                          .make(),
                      catelog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Enim ea Lorem nostrud cillum velit enim ut ea cillum qui. Culpa officia adipisicing dolor fugiat nulla Lorem incididunt fugiat consequat consequat. Aute deserunt dolore esse commodo enim. Voluptate nostrud anim ex cupidatat ipsum qui ipsum reprehenderit consectetur labore. Dolore in dolore culpa fugiat"
                          .text
                          .textStyle(context.captionStyle)
                          .bold
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
