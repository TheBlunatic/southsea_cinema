import 'package:southsea_cinema/models/movie.dart';

class CartItem {
  final Movie movie;
  int quantity;

  CartItem({required this.movie, required this.quantity});

  double get lineTotal {
    return movie.ticketPrice * quantity;
  }
}