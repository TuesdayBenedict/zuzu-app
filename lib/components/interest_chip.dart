import 'package:flutter/material.dart';
import 'package:zuzu/components/fonts.dart';
import 'package:zuzu/components/pallete.dart';
import 'package:zuzu/models/chip_model.dart';

class InterestChip extends StatefulWidget {
  const InterestChip({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<InterestChip> createState() => _InterestChipState();
}

class _InterestChipState extends State<InterestChip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        chipList[widget.index].label,
        style: xLargeBold.copyWith(
          color: chipList[widget.index].value ? white : primary500,
        ),
      ),
      onSelected: (value) {
        setState(() {
          chipList[widget.index].value = value;

          if (value == true) {
            chipSelectedItem.add(chipList[widget.index].label);
            debugPrint('$chipSelectedItem');
          } else {
            chipSelectedItem.remove(chipList[widget.index].label);
            debugPrint('$chipSelectedItem');
          }
        });
      },
      selected: chipList[widget.index].value,
      selectedColor: primary500,
      side: BorderSide(
        color: primary500,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      showCheckmark: false,
    );
  }
}
