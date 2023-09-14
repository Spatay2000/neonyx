import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/custom_tab_bar.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';

import '../home/data/models/banner_local_model.dart';

class CloudFiles extends StatefulWidget {
  const CloudFiles({super.key});

  @override
  State<CloudFiles> createState() => _CloudFilesState();
}

class _CloudFilesState extends State<CloudFiles> with TickerProviderStateMixin {
  TabController? tabController;
  List<String>? data = ['All files', 'Newest', 'Largest', 'Media', 'Shared'];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: data!.length, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '19.4 GB used',
                              style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Maximum 100 GB',
                              style: GoogleFonts.urbanist(
                                  color: NeoColors.primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        CustomButton(
                          height: 42.h,
                          width: 140.w,
                          backgroundStatus: true,
                          title: 'Manage plan',
                          onPressed: () => null,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    // SvgPicture.asset('assets/svg/gra_con.svg'),
                    Container(
                      height: 6.h,
                      width: 327.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color.fromRGBO(47, 145, 151, 0.1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(colors: [
                                  Color.fromRGBO(47, 145, 151, 1),
                                  Color.fromRGBO(183, 175, 107, 1),
                                ])),
                          ),
                          const SizedBox()
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    SizedBox(
                      child: CloudContainerList(
                        docLists: docList,
                        subTitle: 'Manage privacy settings',
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    SizedBox(height: 134.h, child: const ShareDoc()),
                  ],
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(left: 12.w, top: 20.h),
          child: Column(
            children: [
              CustomTabBar(
                secondText: false,
                tabs: data,
                controller: tabController,
                padding: EdgeInsets.zero,
              ),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: tabController,
                  children: const [
                    FilesWidget(),
                    FilesWidget(),
                    FilesWidget(),
                    FilesWidget(),
                    FilesWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CloudContainerList extends StatelessWidget {
  final List<DocList> docLists;
  final String subTitle;
  const CloudContainerList(
      {super.key, required this.docLists, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: 19.w, top: 7.98.h, right: 16.w, bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          children: [
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: docLists.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(docLists[index].iconName),
                                  SizedBox(width: 6.99.w),
                                  Text(
                                    docLists[index].title,
                                    style: GoogleFonts.urbanist(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    docLists[index].volume,
                                    style: GoogleFonts.urbanist(
                                        color: NeoColors.primaryColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(width: 12.w),
                                  SvgPicture.asset(docLists[index].iconRight),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Opacity(
                            opacity: 0.4,
                            child: Container(
                              width: double.infinity,
                              color: NeoColors.primaryColor,
                              height: 1.h,
                            ),
                          )
                        ],
                      ),
                    )),
            SizedBox(
              height: 12.h,
            ),
            Text(
              subTitle,
              style: GoogleFonts.urbanist(
                  color: NeoColors.primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            )
          ],
        ));
  }
}

class ShareDoc extends StatelessWidget {
  const ShareDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: shareList.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
              width: 20.w,
            ),
        itemBuilder: ((context, index) => Container(
              width: 256.w,
              padding: EdgeInsets.only(
                  top: 20.h, left: 16.w, right: 16.w, bottom: 5.h),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(47, 145, 151, 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(47, 145, 151, 0.2),
                                    Color.fromRGBO(47, 145, 151, 0.1)
                                  ])),
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/svg/cont_file.svg'))),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shareList[index].title,
                                style: GoogleFonts.urbanist(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'Sep 25, 2022, 13:25 PM',
                                style: GoogleFonts.urbanist(
                                    color: NeoColors.primaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: NeoColors.primaryColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shareList[index].privatOrPublic == true
                          ? Row(
                              children: [
                                CircleAvatar(
                                  radius: 14.r,
                                  backgroundColor:
                                      const Color.fromRGBO(47, 145, 151, 0.4),
                                  child: SvgPicture.asset(
                                      'assets/svg/private.svg'),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  'Private folder',
                                  style: GoogleFonts.urbanist(
                                      color: NeoColors.primaryColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < imagesList.length; i++)
                                  Container(
                                    margin: EdgeInsets.only(left: 10.w),
                                    child: Align(
                                        widthFactor: 0.5,
                                        child: CircleAvatar(
                                          radius: 20.r,
                                          backgroundImage: AssetImage(
                                            imagesList[i],
                                          ),
                                        )),
                                  ),
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor:
                                      const Color.fromRGBO(55, 125, 126, 0.2),
                                  child: Text(
                                    '+14',
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 9.h),
                        decoration: BoxDecoration(
                            color: NeoColors.buttonBackgroundColor,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color:
                                    const Color.fromRGBO(47, 145, 151, 0.4))),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                shareList[index].amount.toString(),
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SvgPicture.asset('assets/svg/file.svg')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}

class FilesWidget extends StatefulWidget {
  const FilesWidget({super.key});

  @override
  State<FilesWidget> createState() => _FilesWidgetState();
}

class _FilesWidgetState extends State<FilesWidget> {
  List<BannerLocalModel> list = [
    BannerLocalModel(
      title: 'Apple Platf...curity',
      url: 'assets/png/Image-2.png',
    ),
    BannerLocalModel(
      title: "Driver's License",
      url: 'assets/png/Image-1.png',
    ),
    BannerLocalModel(
      title: 'iOS 17 Wallpaper',
      url: 'assets/png/Image-2.png',
    ),
    BannerLocalModel(
      title: 'iPadOS 17...paper',
      url: 'assets/png/Image-3.png',
    ),
    BannerLocalModel(
      title: 'macOS So...paper',
      url: 'assets/png/Image-4.png',
    ),
    BannerLocalModel(
      title: 'visionOS Apps',
      url: 'assets/png/Image-5.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // childAspectRatio: (30 / 54).r,
        crossAxisSpacing: 17.0,
        mainAxisSpacing: 1.0,
        mainAxisExtent: 106,
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  list[index].url,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  list[index].title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DocList {
  final String iconName;
  final String title;
  final String volume;
  final String iconRight;

  const DocList(
      {required this.iconName,
      required this.title,
      required this.volume,
      required this.iconRight});
}

List<DocList> docList = [
  const DocList(
      iconName: 'assets/svg/docs.svg',
      title: 'Docs & credentials',
      volume: '4,2 MB',
      iconRight: 'assets/svg/arrow_right.svg'),
  const DocList(
      iconName: 'assets/svg/people.svg',
      title: 'Social data & resources',
      volume: '13,4 GB',
      iconRight: 'assets/svg/arrow_right.svg')
];

class ShareDocModel {
  final String title;
  final int amount;
  final bool privatOrPublic;

  ShareDocModel(this.title, this.amount, this.privatOrPublic);
}

List<ShareDocModel> shareList = [
  ShareDocModel('Documents', 24, true),
  ShareDocModel('AI prompts', 3985, false),
];

List<String> imagesList = [
  'assets/png/avatar_1_4x_icon.png',
  'assets/png/avatar_4_4x_icon.png',
  'assets/png/avatar_3_4x_icon.png'
];
