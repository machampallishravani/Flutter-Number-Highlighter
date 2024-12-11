import 'package:flutter/material.dart';

class NumberGridPage extends StatefulWidget {
  const NumberGridPage({super.key});

  @override
  State<NumberGridPage> createState() => _NumberGridPageState();
}

class _NumberGridPageState extends State<NumberGridPage> {
  final List<int> numbers = List.generate(100, (index) => index + 1);
  String selectedRule = 'Odd Numbers';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final secondaryColor = theme.colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Number Highlighter',
          style: theme.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        backgroundColor: theme.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Pattern Rule: ',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: selectedRule,
                  items: [
                    'Odd Numbers',
                    'Even Numbers',
                    'Prime Numbers',
                    'Fibonacci Numbers'
                  ]
                      .map((rule) => DropdownMenuItem(
                            value: rule,
                            child: Text(rule),
                          ))
                      .toList(),
                  onChanged: (rule) {
                    setState(() => selectedRule = rule!);
                  },
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  dropdownColor: secondaryColor,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                ),
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  final number = numbers[index];
                  final isHighlighted = _matchesRule(number);
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                        ),
                      ],
                      color: isHighlighted ? primaryColor : Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$number',
                      style: TextStyle(
                        fontSize: 18,
                        color: isHighlighted ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _matchesRule(int number) {
    switch (selectedRule) {
      case 'Odd Numbers':
        return number % 2 != 0;
      case 'Even Numbers':
        return number % 2 == 0;
      case 'Prime Numbers':
        return _isPrime(number);
      case 'Fibonacci Numbers':
        return _isFibonacci(number);
      default:
        return false;
    }
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  bool _isFibonacci(int number) {
    int a = 0, b = 1;
    while (b < number) {
      int temp = b;
      b = a + b;
      a = temp;
    }
    return b == number || number == 0;
  }
}
