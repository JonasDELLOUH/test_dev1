import 'package:flutter/material.dart';
import 'package:test_dev_flutter1/core/models/course_chapter_model.dart';
import 'package:test_dev_flutter1/global_widgets/custom_network_image.dart';
import 'package:test_dev_flutter1/global_widgets/custom_text.dart';

import '../../../core/utils/format_time.dart';

class ChapterTile extends StatelessWidget {
  const ChapterTile({super.key, required this.courseChapterModel, required this.range});
  final CourseChapterModel courseChapterModel;
  final int range;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.all(5),
      width: 75,
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
          CustomNetworkImage(imageUrl: courseChapterModel.image, height: 50, width: double.infinity, borderRadius: BorderRadius.circular(10),),
          const SizedBox(height: 3,),
          CustomText(text: "Chapitre $range", fontSize: 8, fontWeight: FontWeight.w500, textAlign: TextAlign.start,),
          const SizedBox(height: 3,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: formatTime(courseChapterModel.time.toDouble()),
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 8,
              ),
              const Icon(Icons.arrow_right_alt, size: 10, color: Colors.grey,)
          ],)
        ],
      ),
    );
  }
}
