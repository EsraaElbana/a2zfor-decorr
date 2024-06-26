import 'package:flutter/material.dart';
class StarRating extends StatefulWidget {
  final int maxRating;
  final Function(int) onChanged;
  final double size;
  final Color color;
  final int initialRating;

  const StarRating({
    Key? key,
    required this.maxRating,
    required this.onChanged,
    this.size = 30,
    this.color = Colors.yellow,
    this.initialRating = 0,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (int i = 1; i <= widget.maxRating; i++) {
      stars.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _currentRating = i;
              widget.onChanged(_currentRating);
            });
          },
          child: Icon(
            i <= _currentRating ? Icons.star : Icons.star_border,
            size: widget.size,
            color: i <= _currentRating ? widget.color : Colors.grey,
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}