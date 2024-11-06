

class Product{
  final String name;
  final String brand;
  final int sellingPrice;
  final int slashedPrice;
  final int discount;
  final int rating;

  Product({required this.name, required this.brand, required this.sellingPrice, required this.slashedPrice, required this.discount, required this.rating});
  
  Product clone(){
    return copyWith(brand: 'qqqqqqqq');       //overriding the class's instance value for brand when used the clone method
  }

  Product copyWith({           //we can use this method to override any one or subset of values by class's(this.val)  
    String? name,
    String? brand,
    int? sellingPrice,
    int? slashedPrice,
    int? discount,
    int? rating,
  }){
    return Product(name: name ?? this.name, brand: brand ?? this.brand, sellingPrice: sellingPrice ?? this.sellingPrice, slashedPrice: slashedPrice?? this.slashedPrice, discount: discount ?? this.discount, rating: rating ?? this.rating);
  }        // take name provided if nothing is provided(null) then take class's value
}

Product p1 = Product(name: 'asaaaaaa', brand: 'asd', sellingPrice: 12, slashedPrice: 11, discount: 11, rating: 1);

Product p2 = p1.clone();

void main(){
  print(p1.brand);
  print(p2.brand);
}

//just adding comments to stash them here and use stash's stack structure to add it later