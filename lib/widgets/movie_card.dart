import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context)
            .copyWith(
              cardColor: Colors.grey[900],
            )
            .cardColor,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  child: Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  movie.ageRating,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ]),
              const SizedBox(height: 16),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset(
                  movie.posterImagePath,
                  width: 80,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  textDirection: TextDirection.ltr,
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      movie.synopsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ]),
              const SizedBox(height: 16),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "BOOK TICKETS",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    movie.screeningTime,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MovieListing(movie: movie);
                        },
                      ),
                    );
                  },
                  label: 'BOOK NOW',
                ),
              ]),
            ],
          ),
        ));
  }
}
