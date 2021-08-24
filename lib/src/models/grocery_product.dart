class GroceryProduct {
  const GroceryProduct({
    this.name,
    this.image,
    this.price,
    this.weight,
    this.description,
  });
  final String name;
  final String image;
  final double price;
  final String weight;
  final String description;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
    price: 1.0,
    weight: '250g',
    name: 'Aguacate',
    description: 'Es un aguacate',
    image: 'assets/images/aguacate.jpg',
  ),
  GroceryProduct(
    price: 0.75,
    weight: '75g',
    name: 'Manzana',
    description: 'Es un manzana',
    image: 'assets/images/manzana.png',
  ),
  GroceryProduct(
    price: 2.5,
    weight: '500g',
    name: 'Piña',
    description: 'Es un piña',
    image: 'assets/images/pinna.jpg',
  ),
  GroceryProduct(
    price: 1.0,
    weight: '250g',
    name: 'Aguacate',
    description: 'Es un aguacate',
    image: 'assets/images/aguacate.jpg',
  ),
  GroceryProduct(
    price: 0.75,
    weight: '75g',
    name: 'Manzana',
    description: 'Es un manzana',
    image: 'assets/images/manzana.png',
  ),
  GroceryProduct(
    price: 2.5,
    weight: '500g',
    name: 'Piña',
    description: 'Es un piña',
    image: 'assets/images/pinna.jpg',
  ),
];
