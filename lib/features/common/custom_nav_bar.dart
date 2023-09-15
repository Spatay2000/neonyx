import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neonyx/features/common/neo_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<NavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;

  CustomNavigationBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(47, 145, 151, 0.5),
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            return InkWell(
              onTap: () => onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(items[index].icon,
                      color:
                          index == currentIndex ? Colors.white : Colors.grey),
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                        color: index == currentIndex
                            ? NeoColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2)),
                  )
                  // Text(
                  //   items[index].title,
                  //   style: TextStyle(
                  //     color: index == currentIndex ? Colors.white : Colors.grey,
                  //   ),
                  // ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class NavigationBarItem {
  final IconData icon;

  NavigationBarItem({
    required this.icon,
  });
}
