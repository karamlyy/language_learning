import 'package:flutter/cupertino.dart';
import 'package:language_learning/data/model/home/category_model.dart';
import 'package:language_learning/presenter/screens/home/widgets/catergory_card.dart';

class HomeCategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final int? selectedCategoryId;
  final Function(int)? onCategorySelected;

  const HomeCategoriesList({
    super.key,
    required this.categories,
    this.selectedCategoryId,
    this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategoryId == category.id;

          return CategoryCard(
            id: category.id,
            groupName: category.name,
            allWords: category.vocabularyCount,
            masteredWords: category.masteredCount,
            onTap: () {},
            image: category.image,
          );
        },
      ),
    );
  }
}
