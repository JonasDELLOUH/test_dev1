import 'package:flutter/material.dart';
import 'package:test_dev_flutter1/core/constants/colors.dart';
import 'package:test_dev_flutter1/core/models/course_model.dart';
import 'package:test_dev_flutter1/global_widgets/custom_network_image.dart';
import 'package:test_dev_flutter1/pages/profile/widgets/course_tile.dart';
import 'package:test_dev_flutter1/pages/profile/widgets/profile_avatar.dart';
import 'package:test_dev_flutter1/pages/single_course/single_course.dart';

import '../../core/my_painter.dart';
import '../../global_widgets/custom_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late PageController _pageController;
  ValueNotifier<double> _currentPageNotifier = ValueNotifier<double>(0.0);

  // late ScrollController _controller;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skyBlue,
        title: const CustomText(
          text: 'Profile du prof',
          color: Colors.white,
          fontSize: 18,
        ),
        centerTitle: true,
        leading: const BackButton(
          onPressed: null,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColors.skyBlue,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                  const SizedBox(
                    height: 45,
                  )
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                child: ProfileAvatar(imageUrl: 'https://picsum.photos/200/200'),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomText(
                    text: "Max Johnson",
                    fontWeight: FontWeight.w500,
                  ),
                  const CustomText(
                    text: "Batteur de rock dynamique.",
                    fontSize: 12,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [btn("Cours", 0), btn("Photos", 1)],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              _currentPageNotifier.value = index.toDouble();
            },
            children: [courses(), courseGrid()],
          )),
        ],
      ),
    );
  }

  Widget btn(String name, int index) {
    bool isSelected = _currentPageNotifier.value == index.toDouble();
    return isSelected
        ? Expanded(
            child: InkWell(
              onTap: () {
                int page = _currentPageNotifier.value == 0 ? 1 : 0;
                _pageController.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                    child: CustomText(text: name, color: AppColors.skyBlue)),
              ),
            ),
          )
        : Expanded(
            child: TextButton(
              onPressed: () {
                int page = _currentPageNotifier.value == 0 ? 1 : 0;
                _pageController.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: CustomText(text: name, color: AppColors.skyBlue),
            ),
          );
  }

  Widget courses() {
    return ListView.builder(
        itemCount: CourseModel.sampleCourses.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SingleCourse(
                            courseModel: CourseModel.sampleCourses[index])));
              },
              child: CourseTile(courseModel: CourseModel.sampleCourses[index]));
        });
  }






  Widget courseGrid(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children:   [
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: CustomNetworkImage(
                imageUrl: CourseModel.sampleCourses[0].image,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 4,
              child: CustomNetworkImage(
                imageUrl: CourseModel.sampleCourses[1].image,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: CustomNetworkImage(
                imageUrl: CourseModel.sampleCourses[2].image,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 3,
              child: CustomNetworkImage(
                imageUrl: CourseModel.sampleCourses[3].image,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: CustomNetworkImage(
                imageUrl: CourseModel.sampleCourses[4].image,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
