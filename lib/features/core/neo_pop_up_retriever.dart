import 'package:flutter/material.dart';
import 'package:neonyx/features/common/neo_colors.dart';

class NeoPopUpRetriever {
  static Future<void> showBottomSheet(
    BuildContext context, {
    required Widget content,
    required bool isDismissible,
    bool withHorizontalPadding = true,
    bool withHeader = true,
    bool enableDrag = false,
  }) async {
    final padding = withHorizontalPadding
        ? const EdgeInsets.all(8.0)
        : const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0);

    await showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      constraints: withHeader
          ? null
          : BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      barrierColor: const Color.fromRGBO(19, 9, 49, 0.24),
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: NeoColors.soonColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: withHeader ? padding : EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              withHeader
                  ? StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Container(
                          width: 60.0,
                          height: 4.0,
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: const BoxDecoration(
                            color: Color(0xFF7CA7AA),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        );
                      },
                    )
                  : const SizedBox(),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
