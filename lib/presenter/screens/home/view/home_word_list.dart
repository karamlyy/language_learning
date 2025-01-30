// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
// import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
// import 'package:language_learning/presenter/widgets/primary_text.dart';
// import 'package:language_learning/utils/colors/app_colors.dart';
// import 'package:provider/provider.dart';
//
// class HomeWordList extends StatelessWidget {
//   const HomeWordList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final homeProvider = context.watch<HomeProvider>();
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const PrimaryText(
//                 text: "Latest added words",
//                 color: AppColors.primaryText,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 20,
//                 fontFamily: 'DmSerifDisplay',
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: ClampingScrollPhysics(),
//                 itemCount: homeProvider.words.length,
//                 itemBuilder: (context, index) {
//                   final word = homeProvider.words[index];
//                   return WordCard(
//                     id: word.id,
//                     word: word.word,
//                     translation: word.translation,
//                     isLearned: word.isLearned,
//                     onTap: () {
//                       print('${word.id} id-li soz kliklendi');
//                     },
//                     onBookmarkTap: () {
//                       homeProvider.learnWord(word.id);
//                     },
//                   );
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
