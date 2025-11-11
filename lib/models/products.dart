class Product {
  final String name;
  final String category;
  final double oldPrice;
  final String image1;
  final bool isFavourite;
  final String description;
  final double discountPercent;

  const Product({
    required this.name,
    required this.category,
    required this.oldPrice,
    required this.image1,
    this.isFavourite = false,
    required this.description,
    this.discountPercent = 0,
  });

  
  double get price {
    return oldPrice - (oldPrice * (discountPercent / 100));
  }
}

final List<Product> products = [
  const Product(
    name: 'Shoes',
    category: 'Footwear',
    oldPrice: 90.00,
    image1: 'assets/images/shoe2.jpg',
    description: 'This is a description of product 1',
    discountPercent: 20,
  ),
  const Product(
    name: 'Laptop',
    category: 'Electronics',
    oldPrice: 1500.00,
    image1: 'assets/images/laptop.jpg',
    description: 'This is a description of product 2',
    discountPercent: 15,
  ),
  const Product(
    name: 'Jordan Shoes',
    category: 'Footwear',
    oldPrice: 200.00,
    image1: 'assets/images/shoe.jpg',
    description: 'This is a description of product 3',
    discountPercent: 25,
  ),
  const Product(
    name: 'Puma',
    category: 'Footwear',
    oldPrice: 80.00,
    image1: 'assets/images/shoes2.jpg',
    description: 'This is a description of product 4',
    discountPercent: 10,
  ),
];
