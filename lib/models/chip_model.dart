class ChipItem {
  String label;
  bool value;

  ChipItem({
    required this.label,
    required this.value,
  });
}

// chip items
List chipList = [
  ChipItem(label: 'Entertainment', value: false),
  ChipItem(label: 'Gaming', value: false),
  ChipItem(label: 'Art', value: false),
  ChipItem(label: 'Animals', value: false),
  ChipItem(label: 'Comedy', value: false),
  ChipItem(label: 'Dance', value: false),
  ChipItem(label: 'Beauty', value: false),
  ChipItem(label: 'Music', value: false),
  ChipItem(label: 'Food & Drink', value: false),
  ChipItem(label: 'Sports', value: false),
  ChipItem(label: 'DIY', value: false),
  ChipItem(label: 'Science & Education', value: false),
  ChipItem(label: 'Travel', value: false),
  ChipItem(label: 'Family', value: false),
  ChipItem(label: 'Anime & Movie', value: false),
  ChipItem(label: 'Technology', value: false),
  ChipItem(label: 'Outdoors', value: false),
  ChipItem(label: 'Culture', value: false),
  ChipItem(label: 'Health', value: false),
  ChipItem(label: 'Comics', value: false),
];

// selected items
List chipSelectedItem = [];
