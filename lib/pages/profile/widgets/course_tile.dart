import 'package:flutter/material.dart';
import 'package:test_dev_flutter1/core/models/course_model.dart';
import 'package:test_dev_flutter1/global_widgets/custom_network_image.dart';
import 'package:test_dev_flutter1/global_widgets/custom_text.dart';

import '../../../core/utils/format_time.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.all(5),
      // height: 70,
      constraints: const BoxConstraints(maxWidth: 400, maxHeight: 70),
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
        children: [
          Expanded(
              flex: 1,
              child: CustomNetworkImage(
                imageUrl: courseModel.image,
                borderRadius: BorderRadius.circular(10),
              )),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: courseModel.title,
                          fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis, maxLines: 1
                        ),
                      ),
                      CustomText(
                        text: formatTime(courseModel.time.toDouble()),
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 8,
                      )
                    ],
                  ),
                  const SizedBox(height: 2,),
                  CustomText(text: courseModel.description.isEmpty ? "Aucune description" : courseModel.description, fontSize: 8, overflow: TextOverflow.ellipsis, maxLines: 3, textAlign: TextAlign.start,)
                ],
              ))
        ],
      ),
    );
  }
}
