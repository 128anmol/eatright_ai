import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
  final List<String> _facts = [
    "Eggs are a complete protein containing all 9 essential amino acids. One large egg gives 6g protein.",
    "Chicken breast is one of the leanest meats – 100g gives 31g protein and only 3.6g fat.",
    "Fatty fish like salmon and sardines are rich in omega-3s that reduce heart disease risk.",
    "Shrimp is high in cholesterol (~190mg/100g) but low in saturated fat – safe in moderation.",
    "Red meat provides heme iron (easily absorbed), good for anemia but should be limited for heart health.",
    "Grilled or baked meats are healthier than fried meats – lower in fat and calories.",
    "Salmon supports brain health by improving memory and reducing depression risk.",
    "Egg yolks contain choline, essential for brain function and fetal development.",
    "Processed meats (bacon, salami, sausages) increase cancer risk and should be limited.",
    "Lean beef helps in natural muscle building due to creatine, zinc, and vitamin B12.",
    "Cooking meat at high temperatures forms harmful compounds; marinate with lemon/garlic to reduce them.",
    "Chicken skin adds around 100 extra calories and 8g fat – remove for better heart health.",
    "Liver is highly nutritious (vitamin A, iron) but should be eaten occasionally due to high cholesterol.",
    "Omega-3 fatty acids in fish reduce inflammation and help manage arthritis.",
    "Diabetics can eat eggs – egg whites are carb-free and safe; limit yolks to one per day.",
    "Boiled or steamed meats are easier to digest – ideal for gut issues or recovery periods.",
    "Creamy meat sauces are high in calories and fat – opt for lighter gravies or dry roasts.",
    "Tuna is high-protein and low-fat but canned versions may contain mercury – consume in moderation.",
    "Chicken contains selenium, a mineral that supports thyroid health and immune function.",
    "People with high blood pressure should avoid processed meats due to high sodium content.",
    "Mutton contains more saturated fat than chicken – best consumed occasionally.",
    "Eggs support eye health due to lutein and zeaxanthin found in the yolk.",
    "Garlic and turmeric in meat dishes help lower inflammation and cholesterol.",
    "Turkey is lean, high in B vitamins (B3, B6), and great for metabolism and weight control.",
    "Marinating meat with yogurt makes it tender, tasty, and digestion-friendly.",
    "Poached and boiled eggs are the healthiest cooking methods – retain nutrients without added fat.",
    "Omega-3 fatty acids in fish help regulate serotonin, lowering depression risk.",
    "Brown eggs and white eggs have the same nutrition – only the hen’s breed is different.",
    "Eating fish 2–3 times per week is linked with longer life and lower mortality rates.",
    "High-protein diets require more water – drink plenty to support kidney function."
  ];

  String _currentFact = "";

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2D8C8C), Color(0xFFFFA726)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'BITE-SIZED TIPS',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2D8C8C),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _currentFact,
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                    elevation: 8,
                  ),
                ),
              ],
            ),
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
