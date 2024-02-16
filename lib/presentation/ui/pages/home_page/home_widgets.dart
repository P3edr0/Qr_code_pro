import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/home_store.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key, required this.ontap, required this.homeStore})
      : super(key: key);
  final Function(int) ontap;
  final HomeStore homeStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: homeStore.selectedColor,
                  offset: const Offset(0, -2),
                  blurRadius: 4.2)
            ],
            color: ProjectColors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomNavbarItem(
            label: 'Criar',
            customNavBarItemIcon: FontAwesomeIcons.pen,
            pageIndex: 0,
            ontap: ontap,
            homeStore: homeStore,
          ),
          CustomNavbarItem(
            customNavBarItemIcon: FontAwesomeIcons.camera,
            label: 'Ler',
            pageIndex: 1,
            ontap: ontap,
            homeStore: homeStore,
          ),
          CustomNavbarItem(
            label: 'Inserir',
            customNavBarItemIcon: FontAwesomeIcons.image,
            pageIndex: 2,
            ontap: ontap,
            homeStore: homeStore,
          ),
        ]),
      );
    });
  }
}

class CustomNavbarItem extends StatefulWidget {
  @override
  _CustomNavbarItem createState() => _CustomNavbarItem();
  const CustomNavbarItem(
      {Key? key,
      required this.pageIndex,
      required this.ontap,
      required this.label,
      required this.customNavBarItemIcon,
      required this.homeStore})
      : super(key: key);
  final int pageIndex;
  final String label;
  final IconData customNavBarItemIcon;
  final Function(int value) ontap;
  final HomeStore homeStore;
}

class _CustomNavbarItem extends State<CustomNavbarItem> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return InkWell(
          child: AnimatedContainer(
            onEnd: (() => widget.homeStore.setIsExpanded(true)),
            duration: const Duration(milliseconds: 600),
            padding: widget.homeStore.currentIndex == widget.pageIndex
                ? const EdgeInsets.symmetric(horizontal: 15, vertical: 8)
                : const EdgeInsets.all(0),
            height: 44,
            width: widget.homeStore.currentIndex == widget.pageIndex ? 111 : 44,
            decoration: BoxDecoration(
                color: widget.homeStore.currentIndex == widget.pageIndex
                    ? widget.homeStore.customNavBarColorsList[widget.pageIndex]
                        .withOpacity(0.4)
                    : Colors.grey.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Observer(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.customNavBarItemIcon,
                      color: widget.homeStore.currentIndex == widget.pageIndex
                          ? widget.homeStore
                              .customNavBarColorsList[widget.pageIndex]
                          : Colors.white),
                  if (widget.homeStore.currentIndex == widget.pageIndex)
                    AnimatedOpacity(
                      opacity: widget.homeStore.isExpanded ? 1.0 : 0.0,
                      duration: const Duration(seconds: 1),
                      child: SizedBox(
                        width:
                            widget.homeStore.currentIndex == widget.pageIndex &&
                                    widget.homeStore.isExpanded
                                ? 57
                                : 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.label,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color:
                                      widget.homeStore.customNavBarColorsList[
                                          widget.pageIndex]),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              );
            }),
          ),
          onTap: () {
            if (widget.homeStore.currentIndex != widget.pageIndex) {
              widget.homeStore.setIsExpanded(false);
              widget.homeStore.setCurrentIndex(widget.pageIndex);
              widget.homeStore.setSelectedColor(
                  widget.homeStore.customNavBarColorsList[widget.pageIndex]);
              widget.ontap(widget.pageIndex);
            }
          });
    });
  }
}
