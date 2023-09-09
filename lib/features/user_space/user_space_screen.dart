import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:neonyx/core/get_it/configurator.dart';
import 'package:neonyx/domain/entity/user_entity.dart';
import 'package:neonyx/features/common/neo_button.dart';
import 'package:neonyx/features/common/neo_colors.dart';
import 'package:neonyx/features/common/neo_scaffold.dart';
import 'package:neonyx/features/index/index.dart';
import 'package:neonyx/features/user_space/bloc/user_space_bloc.dart';
import 'package:neonyx/features/user_space/bloc/user_space_event.dart';
import 'package:neonyx/features/user_space/bloc/user_space_state.dart';

class UserSpaceScreen extends StatefulWidget {
  const UserSpaceScreen({super.key});

  @override
  State<UserSpaceScreen> createState() => _UserSpaceScreenState();
}

class _UserSpaceScreenState extends State<UserSpaceScreen> {
  final _userSpaceBloc = getIt<UserSpaceBloc>()..add(LoadTopics());

  List<UserEntity> users = [
    UserEntity(
        id: 1,
        avatar: "assets/png/avatar_1_4x_icon.png",
        name: "MemeStream",
        description: "Memes everyday for"),
    UserEntity(
        id: 2,
        avatar: "assets/png/avatar_2_4x_icon.png",
        name: "Go_dev",
        description: "GoLangForEvryone"),
    UserEntity(
        id: 3,
        avatar: "assets/png/avatar_3_4x_icon.png",
        name: "EdNorton",
        description: "Ed Norton from California"),
    UserEntity(
        id: 4,
        avatar: "assets/png/avatar_4_4x_icon.png",
        name: "Spatay",
        description: "CS Go esports player"),
    UserEntity(
        id: 5,
        avatar: "assets/png/avatar_1_4x_icon.png",
        name: "Asylzhan",
        description: "Speed cubing"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _userSpaceBloc,
      child: NeoScaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              elevation: 0,
              forceElevated: true,
              centerTitle: true,
              title: Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Create your space',
                    style: GoogleFonts.urbanist(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: NeoColors.primaryColor),
                  ),
                  const Spacer(),
                  Text(
                    'Skip',
                    style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
            )
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 42.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const Column(
                      children: [
                        Divider(
                          color: NeoColors.soonColor,
                          thickness: 1.0,
                        ),
                        SizedBox(height: 35),
                        Text(
                          "What are you interested in?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: NeoColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Select some topics you’re interested in to help personalize your feed & starting with finding people to follow!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: NeoColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 35),
                        Divider(
                          color: NeoColors.soonColor,
                          thickness: 1.0,
                        ),
                        SizedBox(height: 26),
                      ],
                    ),
                  ),
                  TopicsWidget(
                    onTap: (id) {
                      _userSpaceBloc.add(AddTopic(id: id));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        const Divider(
                          color: NeoColors.soonColor,
                          thickness: 1.0,
                        ),
                        const SizedBox(height: 26),
                        PeoplesWidget(users: users),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: NeoColors.black,
            boxShadow: [
              BoxShadow(
                blurRadius: 25,
                color: NeoColors.black,
                offset: Offset(
                  0,
                  -40,
                ),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: CustomButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IndexNeo(screenIndex: 1))),
              height: 60,
              width: double.infinity,
              title: "Begin Exploration",
              backgroundStatus: true,
            ),
          ),
        ),
      ),
    );
  }
}

class TopicsWidget extends StatelessWidget {
  const TopicsWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function(int id) onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSpaceBloc, UserSpaceState>(
      builder: (context, state) {
        if (state is TopicsLoaded) {
          final topics = state.topics;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Text(
                  "Topics",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: NeoColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 142,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: topics.length,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) => SizedBox(
                    height: 42,
                    child: ListView.separated(
                      // controller: _controllers.addAndGet(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.topics[index].length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        final topic = state.topics[index][i];
                        return GestureDetector(
                          onTap: () => onTap(topic.id),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: NeoColors.buttonBgColor,
                                border: topic.isChoosed
                                    ? const GradientBoxBorder(
                                        gradient: LinearGradient(colors: [
                                          Color.fromRGBO(47, 145, 151, 1),
                                          Color.fromRGBO(183, 175, 107, 1),
                                        ]),
                                      )
                                    : null),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  topics[index][i].topic,
                                  style: const TextStyle(
                                    color: NeoColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                SvgPicture.asset(
                                  topic.isChoosed
                                      ? "assets/svg/check_icon.svg"
                                      : "assets/svg/plus_icon.svg",
                                  height: 13,
                                  width: 12,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class PeoplesWidget extends StatelessWidget {
  final List<UserEntity> users;
  const PeoplesWidget({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Peoples",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: NeoColors.white,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: users.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildePeople(
                users[index].avatar!,
                users[index].name!,
                users[index].description!,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
          ),
        )
      ],
    );
  }

  _buildePeople(String avatar, String name, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            color: NeoColors.grayColor,
            child: Image.asset(
              avatar,
              width: 44,
              height: 44,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: NeoColors.primaryColor,
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: NeoColors.white,
              ),
            ),
          ],
        ),
        const Spacer(),
        const CustomButton(
          title: "Follow",
          backgroundStatus: true,
          height: 40,
          width: 91,
        ),
      ],
    );
  }
}
