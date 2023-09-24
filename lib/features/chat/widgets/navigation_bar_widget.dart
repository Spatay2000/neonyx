import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neonyx/core/get_it/configurator.dart';
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_bloc.dart';
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_event.dart';
import 'package:neonyx/features/chat/widgets/send_button_widget.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_input_field.dart';
import 'package:photo_manager/photo_manager.dart';

class NavigationBarWidget extends StatelessWidget {
  final List<NavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;
  final List<AssetEntity> selectedAssetList;
  final TextEditingController controller;

  NavigationBarWidget({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.selectedAssetList,
    required this.controller,
  }) : super(key: key);

  final _chatDetailsBloc = getIt<ChatDetailsBloc>()..add(LoadChat());

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 56.h,
      decoration: BoxDecoration(
          color: const Color(0xb2000000),
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: selectedAssetList.isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: NeoInputField(
                      isNeedBorder: true,
                      onEditingComplete: () {
                        if (controller.text.isNotEmpty) {
                          // _chatDetailsBloc
                          //     .add(SendMessage(message: controller.text));
                          // controller.clear();
                        }
                      },
                      type: NeoInputType.text,
                      controller: controller,
                      hint: 'Add a caption...',
                      fillColor: NeoColors.buttonBgColor,
                      maxLines: 3,
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: SvgPicture.asset(
                              "assets/svg/file_icon.svg",
                              height: 16,
                              width: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SendButton(
                    onStop: (path) {},
                    sendMessageTap: () {
                      if (selectedAssetList.isNotEmpty) {
                        log("selectedAssetList is NOT EMPTY");
                        if (controller.text.isNotEmpty) {
                          log("qwe: $selectedAssetList");
                          _chatDetailsBloc.add(SendPhoto(
                              listAsset: selectedAssetList,
                              message: controller.text));
                          controller.clear();
                        }
                      }
                    },
                    controller: controller,
                    isSendMessageWithImage: true,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        items.length,
                        (index) {
                          return InkWell(
                            onTap: () => onTap(index),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(items[index].icon,
                                    color: Colors.white),
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
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class NavigationBarItem {
  final String icon;

  NavigationBarItem({
    required this.icon,
  });
}
