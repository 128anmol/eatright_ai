import 'package:flutter/material.dart';
import 'dart:math';

// A data class to hold the fact and its category
class Fact {
  final String text;
  final String category;

  Fact({required this.text, required this.category});
}

class TipsScreen extends StatefulWidget {
  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  // --- Data Section ---
  // The list of facts, now with categories
  final List<Fact> _facts = [
    Fact(text: "Eggs are a complete protein containing all 9 essential amino acids. One large egg gives 6g protein.", category: 'egg'),
    Fact(text: "Chicken breast is one of the leanest meats – 100g gives 31g protein and only 3.6g fat.", category: 'chicken'),
    Fact(text: "Fatty fish like salmon and sardines are rich in omega-3s that reduce heart disease risk.", category: 'fish'),
    Fact(text: "Shrimp is high in cholesterol (~190mg/100g) but low in saturated fat – safe in moderation.", category: 'fish'),
    Fact(text: "Red meat provides heme iron (easily absorbed), good for anemia but should be limited for heart health.", category: 'red-meat'),
    Fact(text: "Grilled or baked meats are healthier than fried meats – lower in fat and calories.", category: 'cooking'),
    Fact(text: "Salmon supports brain health by improving memory and reducing depression risk.", category: 'fish'),
    Fact(text: "Egg yolks contain choline, essential for brain function and fetal development.", category: 'egg'),
    Fact(text: "Processed meats (bacon, salami, sausages) increase cancer risk and should be limited.", category: 'health-warning'),
    Fact(text: "Lean beef helps in natural muscle building due to creatine, zinc, and vitamin B12.", category: 'red-meat'),
    Fact(text: "Cooking meat at high temperatures forms harmful compounds; marinate with lemon/garlic to reduce them.", category: 'cooking'),
    Fact(text: "Chicken skin adds around 100 extra calories and 8g fat – remove for better heart health.", category: 'health-warning'),
    Fact(text: "Liver is highly nutritious (vitamin A, iron) but should be eaten occasionally due to high cholesterol.", category: 'red-meat'),
    Fact(text: "Omega-3 fatty acids in fish reduce inflammation and help manage arthritis.", category: 'fish'),
    Fact(text: "Diabetics can eat eggs – egg whites are carb-free and safe; limit yolks to one per day.", category: 'health'),
    Fact(text: "Boiled or steamed meats are easier to digest – ideal for gut issues or recovery periods.", category: 'cooking'),
    Fact(text: "Creamy meat sauces are high in calories and fat – opt for lighter gravies or dry roasts.", category: 'health-warning'),
    Fact(text: "Tuna is high-protein and low-fat but canned versions may contain mercury – consume in moderation.", category: 'fish'),
    Fact(text: "Chicken contains selenium, a mineral that supports thyroid health and immune function.", category: 'chicken'),
    Fact(text: "People with high blood pressure should avoid processed meats due to high sodium content.", category: 'health-warning'),
    Fact(text: "Mutton contains more saturated fat than chicken – best consumed occasionally.", category: 'red-meat'),
    Fact(text: "Eggs support eye health due to lutein and zeaxanthin found in the yolk.", category: 'egg'),
    Fact(text: "Garlic and turmeric in meat dishes help lower inflammation and cholesterol.", category: 'cooking'),
    Fact(text: "Turkey is lean, high in B vitamins (B3, B6), and great for metabolism and weight control.", category: 'chicken'),
    Fact(text: "Marinating meat with yogurt makes it tender, tasty, and digestion-friendly.", category: 'cooking'),
    Fact(text: "Poached and boiled eggs are the healthiest cooking methods – retain nutrients without added fat.", category: 'egg'),
    Fact(text: "Omega-3 fatty acids in fish help regulate serotonin, lowering depression risk.", category: 'fish'),
    Fact(text: "Brown eggs and white eggs have the same nutrition – only the hen’s breed is different.", category: 'egg'),
    Fact(text: "Eating fish 2–3 times per week is linked with longer life and lower mortality rates.", category: 'fish'),
    Fact(text: "High-protein diets require more water – drink plenty to support kidney function.", category: 'health'),
  ];

  Fact? _currentFact;

  // --- Logic Section ---
  @override
  void initState() {
    super.initState();
    _showRandomFact();
  }

  void _showRandomFact() {
    final random = Random();
    setState(() {
      _currentFact = _facts[random.nextInt(_facts.length)];
    });
  }

  // Helper to get an icon based on the fact's category
  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'egg':
        return Icons.egg_outlined;
      case 'chicken':
      case 'turkey':
        return Icons.fastfood_outlined;
      case 'fish':
        return Icons.set_meal_outlined;
      case 'red-meat':
        return Icons.kebab_dining;
      case 'health':
        return Icons.health_and_safety_outlined;
      case 'health-warning':
        return Icons.warning_amber_rounded;
      default: // for 'cooking' and others
        return Icons.lightbulb_outline;
    }
  }

  // --- UI Section ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nutrition Tips')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AnimatedSwitcher will handle the fade transition
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _currentFact == null
                    ? const CircularProgressIndicator() // Show a loader initially
                    // Use a Key to tell the AnimatedSwitcher that the widget has changed
                    : _FactCard(
                        key: ValueKey<String>(_currentFact!.text),
                        fact: _currentFact!,
                        icon: _getIconForCategory(_currentFact!.category),
                      ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _showRandomFact,
                icon: const Icon(Icons.refresh),
                label: const Text('Show Another Tip'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D8C8C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The new Fact Card widget with enhanced layout
class _FactCard extends StatelessWidget {
  const _FactCard({Key? key, required this.fact, required this.icon}) : super(key: key);

  final Fact fact;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: const Color(0xFFFFA726)),
          const SizedBox(height: 16),
          const Text(
            'BITE-SIZED TIP',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D8C8C),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            fact.text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
