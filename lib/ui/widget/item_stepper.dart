import 'package:flutter/material.dart';

import '../utils/application_colors.dart';

class ItemStepper extends StatefulWidget {
  final Function(int currentValue) onValueChange;
  final int? initialValue;

  const ItemStepper(
      {Key? key, required this.onValueChange, this.initialValue,})
      : super(key: key);

  @override
  State<ItemStepper> createState() => _ItemStepperState();
}

class _ItemStepperState extends State<ItemStepper> {
  int _currentValue = 1;
  final TextEditingController _stepperTEController =
  TextEditingController();

  @override
  void initState() {
    _stepperTEController.text = '${widget.initialValue ?? 1}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        stepperButton(
          onTap: () {
            if (_currentValue > 1) {
              setState(() {
                _currentValue--;
              });
              _stepperTEController.text = _currentValue.toString();
              widget.onValueChange(_currentValue);
            }
          },
          buttonColor: _currentValue == 1 ? colorPrimaryGreen.withOpacity(0.6) : colorPrimaryGreen,
          iconData: Icons.remove,
        ),
        SizedBox(
          width: 50,
          height: 30,
          child: TextField(
            controller: _stepperTEController,
            enabled: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        stepperButton(
          onTap: () {
            if (_currentValue < 20) {
              setState(() {
                _currentValue++;
              });
              widget.onValueChange(_currentValue);
              _stepperTEController.text = _currentValue.toString();
            }
          },
          buttonColor: _currentValue == 20 ? colorPrimaryGreen.withOpacity(0.6) : colorPrimaryGreen,
          iconData: Icons.add,
        ),
      ],
    );
  }

  Widget stepperButton(
      {required VoidCallback onTap, required IconData iconData, required Color buttonColor}) {
    return SizedBox(
      width: 30,
      height: 30,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(8)),
          child: Icon(
            iconData,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}