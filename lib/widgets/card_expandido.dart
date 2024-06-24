import 'package:flutter/material.dart';

class Food {
  final String name;
  final String quantity;
  final String carbs;
  final String fats;
  final String protein;
  bool isChecked;

  Food({
    required this.name,
    required this.quantity,
    required this.carbs,
    required this.fats,
    required this.protein,
    this.isChecked = true,
  });
}

class CardExpandido extends StatelessWidget {
  final Food food;
  final ValueChanged<bool?> onChanged;

  const CardExpandido({super.key, required this.food, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: Checkbox(
          onChanged: onChanged,
          value: food.isChecked,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(food.name),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      initialValue: food.quantity,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("gramas"),
                  ),
                  // Icon(Icons.edit),
                ],
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Carboidratos: ${food.carbs}'),
                Text('Gordura: ${food.fats}'),
                Text('Proteína: ${food.protein}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
