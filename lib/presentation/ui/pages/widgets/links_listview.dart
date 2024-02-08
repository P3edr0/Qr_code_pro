import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

class LinksListview extends StatefulWidget {
  const LinksListview(
      {Key? key,
      required this.currentList,
      required this.listColor,
      required this.listHeight,
      required this.listItemCount,
      required this.selectedIndex,
      required this.setCodigoLido,
      required this.setListaQr,
      required this.setselectedIndex,
      required this.startLoading,
      required this.stopLoading})
      : super(key: key);
  final double listHeight;
  final int listItemCount;
  final int selectedIndex;
  final Color listColor;
  final ObservableList currentList;
  final Function() startLoading;
  final Function() stopLoading;
  final Function(String codigo) setCodigoLido;
  final Function(int index) setselectedIndex;
  final Function() setListaQr;

  @override
  State<LinksListview> createState() => LlinksListviewState();
}

class LlinksListviewState extends State<LinksListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.listHeight,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView.builder(
          itemCount: widget.listItemCount,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Observer(builder: (context) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                      color: widget.selectedIndex != index
                          ? Colors.white
                          : widget.listColor,
                      border: Border.all(
                          width: 1,
                          color: widget.selectedIndex != index
                              ? widget.listColor
                              : Colors.black),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      )),
                  padding: const EdgeInsets.only(left: 20),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        widget.selectedIndex == index
                            ? FontAwesomeIcons.arrowAltCircleRight
                            : FontAwesomeIcons.qrcode,
                        color: widget.selectedIndex != index
                            ? widget.listColor
                            : Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${index + 1} - ",
                        style: TextStyle(
                          fontSize: 16,
                          color: widget.selectedIndex != index
                              ? widget.listColor
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 228,
                        child: Text(
                          widget.currentList[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: widget.selectedIndex != index
                                  ? widget.listColor
                                  : Colors.white,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              onTap: () async {
                if (widget.selectedIndex == index) {
                  widget.setselectedIndex(-1);
                  widget.setCodigoLido('-1');
                  widget.setListaQr();
                } else {
                  widget.startLoading();
                  widget.setCodigoLido(widget.currentList[index]);
                  widget.setselectedIndex(index);
                  Future.delayed(const Duration(seconds: 2), () {
                    widget.stopLoading();
                  });
                }
              },
            );
          }),
    );
  }
}
