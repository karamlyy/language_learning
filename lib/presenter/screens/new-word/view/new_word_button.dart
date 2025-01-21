import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/new-word/provider/new_word_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class NewWordButton extends StatelessWidget {
  const NewWordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final newWordProvider = context.watch<NewWordProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      child: PrimaryButton(
        title: 'Save',
        hasBorder: false,
        isActive: newWordProvider.isWordFormValid(),
        onTap: () {
          newWordProvider.resetFields();

          toastification.show(
            context: context,
            title: PrimaryText(
              text: 'Word saved succesfully!',
              color: AppColors.inputBackground,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.start,
            ),
            showProgressBar: false,
            backgroundColor: AppColors.toastBackground,
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: Colors.white,
              size: 20.w,
            ),
            alignment: Alignment.bottomCenter,
            autoCloseDuration: Duration(seconds: 3),
            padding: EdgeInsets.all(12).r,
          );
        },
      ),
    );
  }
}
