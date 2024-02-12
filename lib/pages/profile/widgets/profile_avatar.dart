import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius:  42,
        backgroundColor: Colors.grey[200],
        backgroundImage: NetworkImage(imageUrl), // Utilisation de backgroundImage au lieu de child
      ),
    )
    ;
  }
}
