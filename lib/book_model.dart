
class Book {
  final String title;
  final String author;
  final String image;

  Book({required this.title, required this.author, required this.image});
}

const _bookAppAsset = 'assets';
final bookAppBackground = '$_bookAppAsset/Bg.png';

final books = [
  Book(
      title: 'Wink Poppy Midnight',
      author: 'April Genevieve Tucholke',
      image: '$_bookAppAsset/book1.jpg'),

  Book(
      title: 'Walking With Miss Millie',
      author: 'Tamara Bundy',
      image: '$_bookAppAsset/book 2.jpg'),

  Book(
      title: 'Trio',
      author: 'Sarah Tolmie',
      image: '$_bookAppAsset/book 3.jpg'),

  Book(
      title: 'The Jungle Book',
      author: 'Rudyard Kipling',
      image: '$_bookAppAsset/book 4.jpg'),

  Book(
      title: 'The Marker Of Swans',
      author: 'Paraig Donnel',
      image: '$_bookAppAsset/book5.jpg')

];
