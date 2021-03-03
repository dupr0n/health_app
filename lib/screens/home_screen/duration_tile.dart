import 'package:flutter/material.dart';

import '../../data/constants.dart';

class DurationTile extends StatefulWidget {
  const DurationTile({
    Key key,
    @required this.duration,
    @required this.selected,
    @required this.selectFunction,
  }) : super(key: key);

  final SelectedDuration duration;
  final SelectedDuration selected;
  final void Function(SelectedDuration newSelect) selectFunction;

  @override
  _DurationTileState createState() => _DurationTileState();
}

class _DurationTileState extends State<DurationTile> {
  @override
  Widget build(BuildContext context) {
    final _isSelected = widget.duration == widget.selected;
    String duration = '';
    switch (widget.duration) {
      case SelectedDuration.day:
        duration = '1D';
        break;
      case SelectedDuration.week:
        duration = '1W';
        break;
      case SelectedDuration.month:
        duration = '1M';
        break;
      case SelectedDuration.max:
        duration = 'Max';
        break;
      default:
        duration = '1D';
        break;
    }
    return GestureDetector(
      onTap: () => widget.selectFunction(widget.duration),
      child: SizedBox(
        width: 30,
        child: Column(
          children: [
            Text(
              duration,
              style: TextStyle(fontWeight: _isSelected ? FontWeight.bold : FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                color: _isSelected ? Colors.purple : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: duration.length.toDouble() * 10,
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
