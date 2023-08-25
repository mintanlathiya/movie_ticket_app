import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenresFormat extends StatefulWidget {
  final List<String> genres;
  Color color;

  GenresFormat(this.genres, this.color, {super.key});

  @override
  _GenresFormatState createState() => _GenresFormatState();
}

class _GenresFormatState extends State<GenresFormat> {
  @override
  Widget build(BuildContext context) {
    Widget dot = Container(
      width: 6.0,
      height: 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(50.0)),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.genres.length, (index) {
        if (index < widget.genres.length - 1) {
          return Row(
            children: [
              Text(
                widget.genres[index],
                style: TextStyle(color: widget.color, fontSize: 12),
              ),
              dot,
            ],
          );
        } else {
          return Text(
            widget.genres[index],
            style: TextStyle(color: widget.color, fontSize: 12),
          );
        }
      }),
    );
  }
}
