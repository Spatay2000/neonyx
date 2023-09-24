import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:photo_manager/photo_manager.dart';

class CancelPhotoSelectionContent extends StatelessWidget {
  final List<AssetEntity> selectedAssetList;
  const CancelPhotoSelectionContent({Key? key, required this.selectedAssetList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          const Text(
            'Cancel selection?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: NeoColors.white,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop(true);
                  Navigator.of(context).pop(true);
                  selectedAssetList.clear();
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border:
                        Border.all(color: NeoColors.soonColor.withOpacity(.4)),
                    color: NeoColors.buttonBackgroundColor,
                  ),
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: NeoColors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border:
                        Border.all(color: NeoColors.soonColor.withOpacity(.4)),
                    color: NeoColors.buttonBackgroundColor,
                  ),
                  child: const Text(
                    "No",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: NeoColors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
