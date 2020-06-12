import 'package:flutter/foundation.dart';

class Shoe {
  final String companyName;
  final String showModel;
  final String price;
  final String imagePath;

  Shoe({
    @required this.companyName,
    @required this.showModel,
    @required this.price,
    @required this.imagePath,
  });

  static List<Shoe> getShoesList() {
    List<Shoe> shoes = [
      Shoe(
        companyName: 'NIKE',
        showModel: 'KYRIE 6',
        price: '₹ 12,995',
        imagePath: 'assets/shoes/shoe-1.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'AIRMAX - IMPACT',
        price: '₹ 7,995',
        imagePath: 'assets/shoes/shoe-2.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'AIRMAX - PEGASUS',
        price: '₹ 11,995',
        imagePath: 'assets/shoes/shoe-3.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'REACT - INFINITY',
        price: '₹ 13,995',
        imagePath: 'assets/shoes/shoe-4.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'AIR - JORDAN',
        price: '₹ 10,495',
        imagePath: 'assets/shoes/shoe-5.png',
      ),
    ];

    return shoes;
  }

  static List<Shoe> getNewArrivalssList() {
    List<Shoe> shoes = [
      Shoe(
        companyName: 'NIKE',
        showModel: 'FREE METCON 3',
        price: '₹ 9,995',
        imagePath: 'assets/shoes/shoe-6.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'LEBRON 17 LOW',
        price: '₹ 13,995',
        imagePath: 'assets/shoes/shoe-7.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'JORDAN - DELTA',
        price: '₹ 10,995',
        imagePath: 'assets/shoes/shoe-8.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'KYRIE 6',
        price: '₹ 12,995',
        imagePath: 'assets/shoes/shoe-1.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'AIRMAX - IMPACT',
        price: '₹ 7,995',
        imagePath: 'assets/shoes/shoe-2.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'AIRMAX - PEGASUS',
        price: '₹ 11,995',
        imagePath: 'assets/shoes/shoe-3.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'REACT - INFINITY',
        price: '₹ 13,995',
        imagePath: 'assets/shoes/shoe-4.png',
      ),
      Shoe(
        companyName: 'NIKE',
        showModel: 'AIR - JORDAN',
        price: '₹ 10,495',
        imagePath: 'assets/shoes/shoe-5.png',
      ),
    ];

    return shoes;
  }
}
