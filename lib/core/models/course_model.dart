import 'package:test_dev_flutter1/core/models/teacher_model.dart';

import 'course_chapter_model.dart';

class CourseModel {
  int id;
  String image;
  String title;
  String description;
  int time;
  List<CourseChapterModel> chapters;
  TeacherModel teacher;
  double progress;

  CourseModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.time,
    required this.chapters,
    required this.teacher,
    required this.progress,
  });

  static List<CourseModel> sampleCourses = [
    CourseModel(
      id: 1,
      image: 'https://picsum.photos/200/200',
      title: 'Apprendre la guitare',
      description: 'Ce cours complet vous apprendra les bases de la guitare ainsi que des techniques avancées. Vous découvrirez différents styles de musique et apprendrez à jouer vos chansons préférées. Que vous soyez débutant ou avancé, ce cours est fait pour vous !',
      time: 120,
      chapters: [
        CourseChapterModel(id: 1, time: 30, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 2, time: 40, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 3, time: 50, image: 'https://picsum.photos/200/200',),
      ],
      teacher: TeacherModel(
        id: 1,
        name: 'Jean Dupont',
        profileImage: 'https://picsum.photos/200/200',
        role: 'Guitariste professionnel',
      ),
      progress: 50,
    ),
    CourseModel(
      id: 2,
      image: 'https://picsum.photos/200/200',
      title: 'Techniques de piano',
      description: 'Ce cours avancé vous enseignera les techniques les plus raffinées du piano. Vous apprendrez à jouer des morceaux complexes et à maîtriser les différentes techniques de jeu. Que vous soyez un pianiste expérimenté ou que vous souhaitiez améliorer vos compétences, ce cours est fait pour vous !',
      time: 90,
      chapters: [
        CourseChapterModel(id: 1, time: 20, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 2, time: 30, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 3, time: 40, image: 'https://picsum.photos/200/200',),
      ],
      teacher: TeacherModel(
        id: 2,
        name: 'Marie Martin',
        profileImage: 'https://picsum.photos/200/200',
        role: 'Pianiste professionnelle',
      ),
      progress: 75,
    ),
    CourseModel(
      id: 3,
      image: 'https://picsum.photos/200/200',
      title: 'Cours de batterie',
      description: 'Ce cours dynamique vous initiera à la batterie et vous permettra de développer vos compétences de percussionniste. Vous apprendrez les techniques de base ainsi que des rythmes avancés pour jouer dans différents styles de musique. Que vous soyez débutant ou que vous souhaitiez perfectionner votre jeu, ce cours est fait pour vous !',
      time: 150,
      chapters: [
        CourseChapterModel(id: 1, time: 40, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 2, time: 50, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 3, time: 60, image: 'https://picsum.photos/200/200',),
      ],
      teacher: TeacherModel(
        id: 3,
        name: 'Lucie Durand',
        profileImage: 'https://picsum.photos/200/200',
        role: 'Batteuse professionnelle',
      ),
      progress: 30,
    ),
    CourseModel(
      id: 4,
      image: 'https://picsum.photos/200/200',
      title: 'Cours de chant',
      description: "Ce cours vous apprendra les techniques vocales de base ainsi que des exercices pour améliorer votre tessiture et votre contrôle vocal. Vous explorerez différents styles de chant et travaillerez sur l'interprétation et l'expression musicale. Que vous soyez débutant ou que vous souhaitiez perfectionner votre voix, ce cours est fait pour vous !",
      time: 100,
      chapters: [
        CourseChapterModel(id: 1, time: 25, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 2, time: 35, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 3, time: 40, image: 'https://picsum.photos/200/200',),
      ],
      teacher: TeacherModel(
        id: 4,
        name: 'Sophie Lambert',
        profileImage: 'https://picsum.photos/200/200',
        role: 'Chanteuse professionnelle',
      ),
      progress: 60,
    ),

    CourseModel(
      id: 5,
      image: 'https://picsum.photos/200/200',
      title: 'Cours de composition musicale',
      description: "Ce cours vous guidera à travers les principes de base de la composition musicale, y compris l'harmonie, la mélodie et la structure. Vous apprendrez à utiliser des logiciels de composition et à développer votre propre style musical. Que vous soyez un compositeur débutant ou que vous souhaitiez affiner vos compétences, ce cours est fait pour vous !",
    time: 180,
      chapters: [
        CourseChapterModel(id: 1, time: 50, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 2, time: 60, image: 'https://picsum.photos/200/200',),
        CourseChapterModel(id: 3, time: 70, image: 'https://picsum.photos/200/200',),
      ],
      teacher: TeacherModel(
        id: 5,
        name: 'Antoine Dubois',
        profileImage: 'https://picsum.photos/200/200',
        role: 'Compositeur professionnel',
      ),
      progress: 40,
    ),


  ];

}
