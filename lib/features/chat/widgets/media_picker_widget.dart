import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaPicker extends StatefulWidget {
  final int maxCount;
  final RequestType requestType;
  final List<AssetEntity> selectedAssetList;
  const MediaPicker(this.maxCount, this.requestType, this.selectedAssetList,
      {super.key});

  @override
  State<MediaPicker> createState() => _MediaPickerState();
}

class _MediaPickerState extends State<MediaPicker> {
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  List<AssetEntity> selectedAssetList = [];

  @override
  void initState() {
    setState(() {
      selectedAssetList = widget.selectedAssetList;
    });
    loadAlbums(widget.requestType).then(
      (value) {
        setState(() {
          albumList = value;
          selectedAlbum = value[0];
        });
        //LOAD RECENT ASSETS
        loadAssets(selectedAlbum!).then(
          (value) {
            setState(() {
              assetList = value;
            });
          },
        );
      },
    );
    loadAssets(selectedAlbum!).then(
      (value) {
        setState(() {
          assetList = value;
        });
      },
    );
    super.initState();
  }

  Future loadAssets(AssetPathEntity selectedAlbum) async {
    List<AssetEntity> assetList = await selectedAlbum.getAssetListRange(
      start: 0,
      // ignore: deprecated_member_use
      end: selectedAlbum.assetCount,
    );
    return assetList;
  }

  Future loadAlbums(RequestType requestType) async {
    var permission = await PhotoManager.requestPermissionExtend();
    List<AssetPathEntity> albumList = [];

    if (permission.isAuth == true) {
      albumList = await PhotoManager.getAssetPathList(
        type: requestType,
      );
    } else {
      PhotoManager.openSetting();
    }

    return albumList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: assetList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: assetList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                AssetEntity assetEntity = assetList[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: assetWidget(assetEntity),
                );
              },
            ),
    );
  }

  Widget assetWidget(AssetEntity assetEntity) => Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(
                  selectedAssetList.contains(assetEntity) == true ? 15 : 0),
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
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${selectedAssetList.indexOf(assetEntity) + 1}",
                        style: TextStyle(
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
