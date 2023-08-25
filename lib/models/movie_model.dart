import 'package:flutter/material.dart';
import 'package:movie_ticket_app/models/cast_model.dart';

class MovieModel {
  int id;
  String name;
  List<String> gener;
  double rating;
  String director;
  String storyLine;
  Image image;
  Image imageLogo;
  List<MovieCastModel> castList;

  MovieModel({
    required this.id,
    required this.gener,
    required this.name,
    required this.rating,
    required this.director,
    required this.storyLine,
    required this.image,
    required this.imageLogo,
    required this.castList,
  });
}
