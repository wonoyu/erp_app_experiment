import 'package:flutter/material.dart';

class CustomDraggableSheet extends StatefulWidget {
  const CustomDraggableSheet({Key? key}) : super(key: key);

  @override
  _CustomDraggableSheetState createState() => _CustomDraggableSheetState();
}

class _CustomDraggableSheetState extends State<CustomDraggableSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
        maxChildSize: 1,
        minChildSize: 0.15,
        initialChildSize: 0.15,
        builder: (context, scrollController) {
          return AnimatedBuilder(
              animation: scrollController,
              builder: (context, child) {
                double percentage = 0;
                if (scrollController.hasClients) {
                  percentage =
                      scrollController.position.viewportDimension / size.height;
                }
                return Stack(
                  children: [
                    Opacity(
                      opacity: percentage == 1 ? 1 : 0,
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: 5,
                          itemBuilder: (context, index) => const ListTile(
                                leading: Icon(Icons.ac_unit_outlined),
                                title: Text('test'),
                                trailing: Icon(Icons.delete),
                              )),
                    ),
                    Opacity(
                        opacity: percentage == 1 ? 0 : 1,
                        child: Container(
                          color: Colors.white,
                          child: const ListTile(
                            leading: Icon(Icons.ac_unit_outlined),
                            title: Text('test'),
                            trailing: Icon(Icons.delete),
                          ),
                        )),
                  ],
                );
              });
        });
  }
}
