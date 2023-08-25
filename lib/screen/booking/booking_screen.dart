import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/screen/booking/components/custom_app_bar.dart';
import 'package:movie_ticket_app/screen/booking/components/date_selector.dart';
import 'package:movie_ticket_app/screen/booking/components/location_text.dart';
import 'package:movie_ticket_app/screen/booking/components/pay_button.dart';
import 'package:movie_ticket_app/screen/booking/components/seat_selector.dart';

class BookingScreen extends StatefulWidget {
  final String? movieName;

  const BookingScreen({super.key, this.movieName});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: const Column(
          children: [
            //app bar
            CustomAppBar('Movie'),

            //date selector
            DateSelector(),

            //Time selector
            // TimeSelector(),

            //Location and theatre
            LocationText(),

            //Seat selector
            SeatSelector(),

            //Pay button and seat categories
            PayButton(),
          ],
        ),
      ),
    );
  }
}
