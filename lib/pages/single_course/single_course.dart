import 'package:flutter/material.dart';
import 'package:test_dev_flutter1/core/models/course_model.dart';
import 'package:test_dev_flutter1/global_widgets/custom_network_image.dart';
import 'package:test_dev_flutter1/pages/single_course/widgets/animated_circular_progress_indicator.dart';
import 'package:test_dev_flutter1/pages/single_course/widgets/chapter_tile.dart';

import '../../core/constants/colors.dart';
import '../../global_widgets/custom_text.dart';

class SingleCourse extends StatefulWidget {
  const SingleCourse({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  State<SingleCourse> createState() => _SingleCourseState();
}

class _SingleCourseState extends State<SingleCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skyBlue,
        title: CustomText(
          text: widget.courseModel.title,
          color: Colors.white,
          fontSize: 18,
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                        color: Colors.limeAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: CustomNetworkImage(imageUrl: "https://picsum.photos/200/200", borderRadius: BorderRadius.circular(10),),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: CircleAvatar(
                    backgroundColor: Colors.grey[900]?.withOpacity(0.7),
                    radius: 20,
                    child: const Icon(
                      Icons.play_arrow_sharp,
                      color: Colors.white,
                      size: 15,
                    ),
                ),
                  ),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomText(
                        text: "Détails du cours",
                        textAlign: TextAlign.start,
                        color: Colors.grey),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.courseModel.chapters.length,
                          itemBuilder: (context, index) {
                            return ChapterTile(
                              courseChapterModel:
                                  widget.courseModel.chapters[index],
                              range: index + 1,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 400),
                      padding: const EdgeInsets.all(10),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "À propos",
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          CustomText(
                            text: widget.courseModel.description,
                            fontSize: 10,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      text: "Professeur",
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.grey[200],
                                          backgroundImage: NetworkImage(widget
                                              .courseModel
                                              .teacher
                                              .profileImage), // Utilisation de backgroundImage au lieu de child
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text:
                                                    widget.courseModel.teacher.name,
                                                color: AppColors.skyBlue,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              CustomText(
                                                  text: widget
                                                      .courseModel.teacher.role,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  fontSize: 10)
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const CustomText(
                                      text: "Progression",
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    AnimatedCircularProgressIndicator(
                                      targetPercentage:
                                          widget.courseModel.progress,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(400, 100),
                        backgroundColor: Colors.grey[900],
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomText(
                              text: 'Poursuivre le cours',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              // Couleur du texte
                              fontSize: 13,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white, // Couleur de l'icône
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(400, 100),
                        backgroundColor: AppColors.skyBlue,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Voir d'autres cours",
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            // Couleur du texte
                            fontSize: 13,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
