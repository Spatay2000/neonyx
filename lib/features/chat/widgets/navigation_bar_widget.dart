import 'dart:convert';
import 'dart:developer';
import 'dart:io';
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

class NavigationBarWidget extends StatefulWidget {
  final List<NavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;
  final List<AssetEntity> selectedAssetList;
  final TextEditingController controller;

  const NavigationBarWidget({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.selectedAssetList,
    required this.controller,
  }) : super(key: key);

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  final _chatDetailsBloc = getIt<ChatDetailsBloc>()..add(LoadChat());

  List<File> selectedFiles = [];

  Future convertAssetsToFiles(List<AssetEntity> assetEntities) async {
    for (var i = 0; i < assetEntities.length; i++) {
      final File? file = await assetEntities[i].originFile;

      if (selectedFiles.contains(file)) {
        setState(() {
          selectedFiles.remove(file!);
        });
      } else {
        setState(() {
          selectedFiles.add(file!);
        });
      }
      log("FILES: ${selectedFiles.length}");
    }
    return selectedFiles;
  }

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
        child: widget.selectedAssetList.isNotEmpty
            ? Row(
                children: [
                  Expanded(
                    child: NeoInputField(
                      isNeedBorder: true,
                      onEditingComplete: () async {
                        // if (widget.selectedImageFiles.isNotEmpty) {
                        //   List<File> files = await convertAssetsToFiles(
                        //       widget.selectedImageFiles);
                        //   log("NEW FILES: ${files.length}");
                        //   _chatDetailsBloc.add(SendPhoto(
                        //       imagesPath: encodeUrlImg(files),
                        //       message: widget.controller.text));
                        //   widget.controller.clear();
                        //   Navigator.pop(context);
                        // }
                      },
                      type: NeoInputType.text,
                      controller: widget.controller,
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
                    sendMessageTap: () async {
                      if (widget.selectedAssetList.isNotEmpty) {
                        List<File> files = await convertAssetsToFiles(
                            widget.selectedAssetList);
                        log("NEW FILES: ${files.length}");
                        _chatDetailsBloc.add(SendPhoto(
                            imagesPath: encodeUrlImg(files),
                            message: widget.controller.text));
                        widget.controller.clear();
                        _chatDetailsBloc.add(LoadChat());
                        Navigator.pop(context);
                      }
                    },
                    controller: widget.controller,
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
                        widget.items.length,
                        (index) {
                          return InkWell(
                            onTap: () => widget.onTap(index),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  widget.items[index].icon,
                                  colorFilter: ColorFilter.mode(
                                      index == widget.currentIndex
                                          ? NeoColors.white
                                          : NeoColors.primaryColor,
                                      BlendMode.srcIn),
                                ),
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

  List<String> encodeUrlImg(List<File> imageFiles) {
    List<String> images = [];

    for (int i = 0; i < imageFiles.length; i++) {
      List<int> imageBytes = imageFiles[i].readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      images.add(base64Image);
    }

    return images;
  }
}

class NavigationBarItem {
  final String icon;

  NavigationBarItem({
    required this.icon,
  });
}
