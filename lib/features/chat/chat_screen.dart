import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/chat/widgets/chat_list_widget.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_input_field.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TabController? _tabController;
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  bool focusOn = false;

  List<String> chatFolders = [
    'All chat',
    'Private',
    'Communities',
  ];
  List<String> searchFolders = [
    'Chats',
    'Files',
    'People',
  ];

  bool isSearchTapped = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        focusOn = _focusNode.hasFocus;
      });
      log("FOCUS: $focusOn");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: chatFolders.length,
      child: NeoScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                      left: 18.0, right: 18, top: 65, bottom: 25)
                  .r,
              child: isSearchTapped
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSearchTapped = false;
                              focusOn = false;
                            });
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: NeoColors.soonColor,
                          ),
                        ),
                        Text(
                          "Search",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                            color: NeoColors.primaryColor.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    )
                  : Row(
                      children: [
                        Text(
                          'Chats',
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSearchTapped = true;
                            });
                          },
                          child: SvgPicture.asset('assets/svg/search.svg'),
                        ),
                      ],
                    ),
            ),
            isSearchTapped
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: NeoInputField(
                      // width: 200,
                      type: NeoInputType.text,
                      controller: _searchController,
                      focusNode: _focusNode,
                      enableContentPadding: true,
                      // readOnly: widget.readFromAddressOnly,
                      isNeedBorder: true,
                      isDense: true,
                      suffix: GestureDetector(
                        onTap: () {
                          _searchController.clear();
                        },
                        child: Text(
                          "Clear",
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: NeoColors.soonColor,
                          ),
                        ),
                      ),
                      onEditingComplete: () {},
                      // isChoosedAddress: widget.isChoosedFromAddressesList,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16).r,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    isScrollable: true,
                    onTap: (int index) {},
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide.none),
                    labelPadding: EdgeInsets.zero,
                    tabs: [
                      for (int i = 0; i < chatFolders.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: ShapeDecoration(
                              color: const Color(0x192F9096),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  focusOn ? searchFolders[i] : chatFolders[i],
                                  style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Opacity(
                                  opacity: 0.40,
                                  child: Text(
                                    '2',
                                    style: GoogleFonts.urbanist(
                                      color: NeoColors.primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ]),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: List.generate(
                  focusOn ? searchFolders.length : chatFolders.length,
                  (index) => focusOn
                      ? const SearchResultsNotFoundWidget()
                      : const ChatListWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultsNotFoundWidget extends StatelessWidget {
  const SearchResultsNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Not Found',
        style: GoogleFonts.urbanist(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: NeoColors.grayColor,
        ),
      ),
    );
  }
}
