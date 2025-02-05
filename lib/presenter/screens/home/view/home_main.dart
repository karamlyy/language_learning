import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:language_learning/presenter/screens/home/widgets/list_card.dart';

class HomeMain extends StatelessWidget {
  final List<ListCard> lists;
  final int selectedListId;
  final Function(int)? onListSelected;

  const HomeMain({
    super.key,
    required this.lists,
    required this.selectedListId,
    this.onListSelected,
  });

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lists.length,
        itemBuilder: (context, index) {
          final list = lists[index];
          return ListCard(
            id: list.id,
            listName: list.listName,
            isActive: list.isActive,
            onTap: () {
              homeProvider.setSelectedList(list.id);
            },
          );
        },
      ),
    );
  }
}
