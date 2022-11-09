import 'package:flutter/material.dart';

class AnimatedAppBar extends StatelessWidget {
  final AnimationController colorAnimationController;
  final Animation colorTween, homeTween, workOutTween, iconTween, searchTween;
  final void Function() onPressed;

  const AnimatedAppBar({
    super.key,
    required this.colorAnimationController,
    required this.onPressed,
    required this.colorTween,
    required this.homeTween,
    required this.iconTween,
    required this.searchTween,
    required this.workOutTween,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => Container(
              decoration: BoxDecoration(color: colorTween.value),
              height: 86,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, left: 16, right: 6),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  titleSpacing: 0.0,
                  title: Container(
                      height: 36,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: searchTween.value,
                            labelText: 'Trên Boong Concept...',
                            prefixIcon: const Icon(Icons.search),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 198, 195, 195),
                              ),
                            )),
                      )),
                  actions: <Widget>[
                    SizedBox(width: 12),
                    Icon(
                      size: 26,
                      Icons.person_outline_rounded,
                      color: iconTween.value,
                    ),
                  ],
                ),
              ),
            ));
  }
}
