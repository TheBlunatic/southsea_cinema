import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        id: "0",
        title: 'Dune: Part One',
        synopsis: "Paul Atreides arrives on Arrakis after his father accepts the stewardship of the dangerous planet. However, chaos ensues after a betrayal as forces clash to control melange, a precious resource.",
        ageRating: '12A',
        screeningTime: '7:00 PM',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/dunepart1poster2021.jpg',
      ),
      Movie(
        id: "1",
        title: 'Jurassic Park (1993)',
        synopsis: "An industrialist invites some experts to visit his theme park of cloned dinosaurs. After a power failure, the creatures run loose, putting everyone's lives, including his grandchildren's, in danger.",
        ageRating: 'PG',
        screeningTime: '9:00 PM',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/jurassicparkposter1993.jpg',
      ),
    ];
  }
}