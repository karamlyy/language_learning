import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/notification/cubit/notification_cubit.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: PrimaryText(
            text: 'Notifications',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            fontFamily: 'DMSerifDisplay',
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 16.w,
              ),
              child: Icon(
                Icons.done_all,
                size: 20.w,
              ),
            )
          ],
        ),
        body: BlocListener<NotificationCubit, BaseState>(
          listener: (context, state) {},
          child: NotificationBody(),
        ),
      ),
    );
  }
}

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else if (state is SuccessState) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0).r,
              child: NotificationList(),
            ),
          );
        } else {
          return const Center(child: Text('Initializing...'));
        }
      },
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessState) {
          final data = state.data;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final notification = data[index];
              print(notification);
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.w,
                  vertical: 5.h,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12).r,
                  tileColor: AppColors.unselectedItemBackground,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24).r,
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  title: PrimaryText(
                    text: 'New ${notification.name} Category Added ',
                    fontSize: 16,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                  subtitle: PrimaryText(
                    text: 'Let’s start learning now',
                    color: AppColors.primaryText.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: _buildCategoryImage(notification.image),
                ),
              );
            },
          );
        } else {
          return Center(child: Text('Loading...'));
        }
      },
    );
  }

  Widget _buildCategoryImage(String? base64String) {
    if (base64String == null || base64String.isEmpty) {
      return SizedBox(
        width: 56.w,
        height: 56.h,
        child: Icon(Icons.language, size: 30, color: Colors.grey),
      );
    }

    try {
      Uint8List bytes = base64Decode(base64String);
      return Image.memory(
        bytes,
        width: 56.w,
        height: 56.h,
        fit: BoxFit.cover,
      );
    } catch (e) {
      return const SizedBox(
        width: 36,
        height: 36,
        child: Icon(
          Icons.broken_image,
          size: 30,
          color: AppColors.error,
        ),
      );
    }
  }
}
