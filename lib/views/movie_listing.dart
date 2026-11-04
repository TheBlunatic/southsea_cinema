import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<StatefulWidget> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  int _selectedQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text(
                "${widget.movie.title} (${widget.movie.ageRating})",
                textScaler: TextScaler.linear(2),
              ),
              const SizedBox(width: 16)
            ],
          ),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(width: 16),
            Image.asset(
              widget.movie.posterImagePath,
              width: 80,
              height: 140,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
          ]),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text("Southsea Cinema Room"),
              const SizedBox(width: 16)
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text(widget.movie.screeningTime),
              const SizedBox(width: 16)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text(
                  "Please note that Discounts / Membership Benefits will be \napplied once you have selected your tickets"),
              const SizedBox(width: 16)
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text("Select Quantities (Up to 5 in total)"),
              const SizedBox(width: 16)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text(
                "Tickets",
                textScaler: TextScaler.linear(1.67),
              ),
              const SizedBox(width: 16)
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              DropdownMenu<int>(
                initialSelection: 10,
                onSelected: (int? value) {
                  _selectedQuantity = value ?? 0;
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 1, label: '1'),
                  DropdownMenuEntry(value: 2, label: '2'),
                  DropdownMenuEntry(value: 3, label: '3'),
                  DropdownMenuEntry(value: 4, label: '4'),
                  DropdownMenuEntry(value: 5, label: '5'),
                ],
              ),
              const SizedBox(width: 16),
              Text(
                "Adult (£${widget.movie.ticketPrice.toStringAsFixed(2)})",
                textScaler: TextScaler.linear(1.5),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: cinemaBrandDark,
                  foregroundColor: Colors.white,
                ),
                onPressed: () =>
                    setState(() => _ticketQuantity += _selectedQuantity),
                child: const Text('Add to order'),
              ),
              const SizedBox(width: 16)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text("$_ticketQuantity tickets in basket"),
              const SizedBox(width: 16)
            ],
          ),
        ],
      ),
    );
  }
}
