import 'package:flutter_svg/flutter_svg.dart';

class WordGroup {
  final int id;
  final String groupName;
  final int masteredWords;
  final int allWords;
  final SvgPicture icon;

  WordGroup({
    required this.id,
    required this.groupName,
    required this.masteredWords,
    required this.allWords,
    required this.icon,
  });
}