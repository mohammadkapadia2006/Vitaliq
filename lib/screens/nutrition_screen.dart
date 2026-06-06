import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitaliq/core/constants/app_colors.dart';

class NutritionScreen extends ConsumerWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ── Header ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nutrition',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Fuel your body right.',
                      style: TextStyle(
                        color: Color(0xFF8E8E9A),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── Calorie Ring ──
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFF2D2D44)),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Today's Calories",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Ring
                              SizedBox(
                                width: 110,
                                height: 110,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      value: 1240 / 2000,
                                      strokeWidth: 10,
                                      backgroundColor:
                                      const Color(0xFF2D2D44),
                                      valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        AppColors.calories,
                                      ),
                                    ),
                                    const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '1,240',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          'kcal',
                                          style: TextStyle(
                                            color: Color(0xFF8E8E9A),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Macros
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _MacroRow(
                                    label: 'Protein',
                                    current: 68,
                                    target: 120,
                                    color: AppColors.primary,
                                    unit: 'g',
                                  ),
                                  const SizedBox(height: 12),
                                  _MacroRow(
                                    label: 'Carbs',
                                    current: 145,
                                    target: 250,
                                    color: AppColors.calories,
                                    unit: 'g',
                                  ),
                                  const SizedBox(height: 12),
                                  _MacroRow(
                                    label: 'Fats',
                                    current: 42,
                                    target: 65,
                                    color: AppColors.accent,
                                    unit: 'g',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Remaining
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.calories.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.local_fire_department,
                                    color: AppColors.calories, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  '760 kcal remaining',
                                  style: TextStyle(
                                    color: AppColors.calories,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // ── Log Meal Button ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Log a Meal'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // ── Today's Meals ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today's Meals",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _MealSection(
                      mealType: 'Breakfast',
                      icon: Icons.wb_sunny_outlined,
                      color: AppColors.calories,
                      calories: '420 kcal',
                      items: const ['Oatmeal with berries', 'Black coffee'],
                    ),
                    const SizedBox(height: 12),
                    _MealSection(
                      mealType: 'Lunch',
                      icon: Icons.lunch_dining,
                      color: AppColors.accent,
                      calories: '580 kcal',
                      items: const [
                        'Grilled chicken salad',
                        'Brown rice',
                        'Water'
                      ],
                    ),
                    const SizedBox(height: 12),
                    _MealSection(
                      mealType: 'Snack',
                      icon: Icons.apple,
                      color: AppColors.success,
                      calories: '240 kcal',
                      items: const ['Protein bar', 'Apple'],
                    ),
                    const SizedBox(height: 12),
                    _MealSection(
                      mealType: 'Dinner',
                      icon: Icons.dinner_dining,
                      color: AppColors.sleep,
                      calories: '— kcal',
                      items: const ['Not logged yet'],
                      isEmpty: true,
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // ── Water Tracker ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF2D2D44)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.water_drop,
                              color: AppColors.water, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Water Intake',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '1.2 / 2.5 L',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add, size: 16),
                            label: const Text('Add 250ml'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.water.withOpacity(0.2),
                              foregroundColor: AppColors.water,
                              elevation: 0,
                              minimumSize: Size.zero,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: 1.2 / 2.5,
                          minHeight: 10,
                          backgroundColor: const Color(0xFF2D2D44),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.water),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}

// ── Macro Row ──
class _MacroRow extends StatelessWidget {
  final String label;
  final int current;
  final int target;
  final Color color;
  final String unit;

  const _MacroRow({
    required this.label,
    required this.current,
    required this.target,
    required this.color,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(color: Color(0xFF8E8E9A), fontSize: 12),
            ),
            const SizedBox(width: 40),
            Text(
              '$current/$target$unit',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: current / target,
              minHeight: 6,
              backgroundColor: const Color(0xFF2D2D44),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Meal Section ──
class _MealSection extends StatelessWidget {
  final String mealType;
  final IconData icon;
  final Color color;
  final String calories;
  final List<String> items;
  final bool isEmpty;

  const _MealSection({
    required this.mealType,
    required this.icon,
    required this.color,
    required this.calories,
    required this.items,
    this.isEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isEmpty
              ? const Color(0xFF2D2D44)
              : color.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealType,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  items.join(' • '),
                  style: TextStyle(
                    color: isEmpty
                        ? const Color(0xFF8E8E9A)
                        : const Color(0xFF8E8E9A),
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            calories,
            style: TextStyle(
              color: isEmpty ? const Color(0xFF8E8E9A) : color,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}