import '../Screens/products/banana.dart';
import '../Screens/products/cakes.dart';
import '../Screens/products/chicken.dart';
import '../Screens/products/coconut.dart';
import '../Screens/products/egg.dart';
import '../Screens/products/fish/fish.dart';
import '../Screens/products/milk.dart';
import '../Screens/products/pickle/pickle_page.dart';
import '../Screens/products/spices/spices.dart';
import '../Screens/products/vegetable/vegetables.dart';

List prodList = [
  'assets/milk.jpg',
  'assets/coconut.png',
  'assets/egg.jpg',
  'assets/pickle.png',
  'assets/fish.jpg',
  'assets/chicken.jpg',
  'assets/spices.jpg',
  'assets/veg.jpg',
  'assets/banana.jpg',
  'assets/cakes.jpg',

];

List prodTitle = [
  'Milk',
  'Coconut',
  'Egg',
  'Pickles',
  'Fish',
  'Chicken',
  'Spices',
  'Vegetables',
  'Banana',
  'Cakes'
];

 List productType =  [
      {
        'widget':  const MilkPage(),
        'fav': true,

      },
      {
        'widget':  const CoconutPage(),
        'fav': true,

      },
      {
        'widget':  const EggPage(),
        'fav': true,

      },
      {
        'widget':   PicklePage(),
        'fav': true,

      },
        {
        'widget':   FishPage(),
        'fav': true,

      },
      
      {
        'widget': const ChickenPage(),
        'fav': true,

      },
      {
        'widget':  SpicesPage(),
        'fav': true,

      },
      {
        'widget':   VegetablesPage(),
        'fav': true,

      },
      {
        'widget':   const BananaSellersPage(),
        'fav': true,

      },
      {
        'widget':  const CakeSellersPage(),
        'fav': true,

      }
   

    ];
