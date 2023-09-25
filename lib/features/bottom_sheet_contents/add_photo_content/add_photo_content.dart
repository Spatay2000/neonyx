import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neonyx/core/get_it/configurator.dart';
import 'package:neonyx/features/alert_dialog_contents/cancel_photo_selection_content/cancel_photo_selection_content.dart';
import 'package:neonyx/features/bottom_sheet_contents/add_photo_content/bloc/add_photo_bloc.dart';
import 'package:neonyx/features/bottom_sheet_contents/add_photo_content/bloc/add_photo_event.dart';
import 'package:neonyx/features/chat/widgets/media_services.dart';
import 'package:neonyx/features/chat/widgets/navigation_bar_widget.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/core/neo_alert_dialog.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPhotoContent extends StatefulWidget {
  final int maxCount;
  final RequestType requestType;
  final List<AssetEntity> selectedAssetList;
  // final TextEditingController controller;
  const AddPhotoContent(
    this.maxCount,
    this.requestType,
    // this.controller,
    this.selectedAssetList, {
    Key? key,
  }) : super(key: key);

  @override
  State<AddPhotoContent> createState() => _AddPhotoContentState();
}

class _AddPhotoContentState extends State<AddPhotoContent> {
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  List<AssetEntity> selectedAssetList = [];

  int currentIndex = 0;
  final addPhotoBloc = getIt<AddPhotoBloc>();

  final List<NavigationBarItem> navItems = [
    NavigationBarItem(
      icon: 'assets/svg/first.svg',
    ),
    NavigationBarItem(
      icon: 'assets/svg/sec.svg',
    ),
    NavigationBarItem(
      icon: 'assets/svg/third.svg',
    ),
    NavigationBarItem(
      icon: 'assets/svg/four.svg',
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      addPhotoBloc.add(AddPhotoIndexChangedPage(index: index));
    });
  }

  final controller = TextEditingController();

  @override
  void initState() {
    addPhotoBloc.add(AddPhotoIndexChangedPage(index: currentIndex));
    setState(() {
      selectedAssetList = widget.selectedAssetList;
    });
    log("QWE selectedAssetList: $selectedAssetList");
    log("QWE widget.selectedAssetList: ${widget.selectedAssetList}");
    MediaServices().loadAlbums(widget.requestType).then(
      (value) {
        setState(() {
          albumList = value;
          selectedAlbum = value[3];
        });
        //LOAD RECENT ASSETS
        MediaServices().loadAssets(selectedAlbum!).then(
          (value) {
            setState(() {
              assetList = value;
            });
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090F0B),
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        child: NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            if (notification.extent < .4) {
              Navigator.pop(context);
            }
            return true;
          },
          child: DraggableScrollableSheet(
            maxChildSize: 1,
            initialChildSize: .6,
            minChildSize: .5,
            // expand: false,
            builder: ((context, scrollController) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                        color: NeoColors.soonColor,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(47, 145, 151, 0.2),
                              Color.fromRGBO(121, 214, 152, 0),
                            ]),
                      ),
                      child: SafeArea(
                          child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: scrollController,
                        child: Column(
                          children: [
                            Container(
                              width: 60.0,
                              height: 4.0,
                              margin: const EdgeInsets.only(bottom: 8.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFF7CA7AA),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (selectedAssetList.isNotEmpty) {
                                        NeoAlertDialog.showTTAlertDialog(
                                          context: context,
                                          content: CancelPhotoSelectionContent(
                                            selectedAssetList:
                                                selectedAssetList,
                                          ),
                                          isDismissible: false,
                                        );
                                      } else {
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text(
                                      "Back",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: NeoColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  // const Text(
                                  //   "Add Photo",
                                  //   style: TextStyle(
                                  //     color: NeoColors.primaryColor,
                                  //     fontSize: 16,
                                  //     fontWeight: FontWeight.w400,
                                  //   ),
                                  // ),
                                  // const SizedBox(width: 33),
                                  DropdownButton<AssetPathEntity>(
                                    value: selectedAlbum,
                                    onChanged: (AssetPathEntity? value) {
                                      setState(() {
                                        selectedAlbum = value;
                                      });
                                      MediaServices()
                                          .loadAssets(selectedAlbum!)
                                          .then(
                                        (value) {
                                          setState(() {
                                            assetList = value;
                                          });
                                        },
                                      );
                                    },
                                    items: albumList
                                        .map<DropdownMenuItem<AssetPathEntity>>(
                                            (AssetPathEntity album) {
                                      return DropdownMenuItem<AssetPathEntity>(
                                        value: album,
                                        // ignore: deprecated_member_use
                                        child: Text(
                                            "${album.name} (${album.assetCount})"),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            assetList.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : GestureDetector(
                                    onPanUpdate: (details) {
                                      if (details.delta.dy < -20) {
                                        setState(() {});
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      child: GridView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: assetList.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                        ),
                                        itemBuilder: (context, index) {
                                          AssetEntity assetEntity =
                                              assetList[index];
                                          return Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: assetWidget(assetEntity),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      )),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: NavigationBarWidget(
                          onTap: (value) {},
                          items: navItems,
                          currentIndex: 0,
                          controller: controller,
                          selectedAssetList: selectedAssetList,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget assetWidget(AssetEntity assetEntity) => Stack(
        children: [
          Positioned.fill(
            child: AssetEntityImage(
              assetEntity,
              isOriginal: false,
              thumbnailSize: const ThumbnailSize.square(250),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  selectAsset(assetEntity: assetEntity);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedAssetList.contains(assetEntity) == true
                          ? Colors.blue
                          : Colors.black12,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedAssetList.contains(assetEntity)
                            ? Colors.transparent
                            : Colors.white,
                        width: 1.5,
                      ),
                      gradient: const LinearGradient(colors: [
                        Color(0xFFB7AF6B),
                        Color(0xFF2F9197),
                      ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Icon(
                        CupertinoIcons.checkmark_alt,
                        color: selectedAssetList.contains(assetEntity) == true
                            ? Colors.white
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  void selectAsset({
    required AssetEntity assetEntity,
  }) {
    if (selectedAssetList.contains(assetEntity)) {
      setState(() {
        selectedAssetList.remove(assetEntity);
      });
    } else if (selectedAssetList.length < widget.maxCount) {
      setState(() {
        selectedAssetList.add(assetEntity);
      });
    }
  }
}
