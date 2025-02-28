import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Product Model
class Product {
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final bool isTop10;

  Product({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    this.isTop10 = false,
  });
}

// User Model
class User {
  final String profileImageUrl;
  final String username;

  User({required this.profileImageUrl, required this.username});
}

// Sample Data
final List<Product> sampleProducts = [
  Product(
    imageUrl: 'assets/lg_stand_tv.png',
    name: 'Electric Fan',
    description: 'High-performance Electric Fan',
    price: 50000,
  ),
  Product(
    imageUrl: 'assets/smart_tv.png',
    name: 'Notebook',
    description: 'Latest High-performance Laptop',
    price: 1000000,
    isTop10: true,
  ),
  Product(
    imageUrl: 'assets/4k.png',
    name: 'Beer and Snack',
    description: 'Delicious Beer and Snack Set',
    price: 15000, ),
  Product(
    imageUrl: 'assets/lg_stand_tv.png',
    name: 'AMD Processor',
    description: 'High-performance AMD Processor',
    price: 300000,
  ),
];

// Sample data for "Best user profiles Top 10"
final profiles = [
  {'name': 'Name01', 'imageUrl': 'assets/cat1.png'},
  {'name': 'Name02', 'imageUrl': 'assets/cat2.png'},
  {'name': 'Name03', 'imageUrl': 'assets/cat3.png'},
  {'name': 'Name04', 'imageUrl': 'assets/cat4.png'},
  {'name': 'Name05', 'imageUrl': 'assets/cat5.png'},
  {'name': 'Name06', 'imageUrl': 'assets/cat6.png'},
  {'name': 'Name07', 'imageUrl': 'assets/cat7.png'},
  {'name': 'Name08', 'imageUrl': 'assets/cat8.png'},
  {'name': 'Name09', 'imageUrl': 'assets/cat9.png'},
  {'name': 'Name10', 'imageUrl': 'assets/cat10.png'},
];

final User sampleUser = User(
  profileImageUrl: 'https://via.placeholder.com/100?text=Cat',
  username: 'Name01',
);

final List<String> bannerImages = [
  'assets/electric_fan.png',
  'assets/laptop.png',
  'assets/microwave.png',
  'assets/pen.png',
];

// Main App
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

// Main Screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Placeholder(), // Categories
    const Placeholder(), // Cart
    const Placeholder(), // Notifications
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 344 / 240,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.95,
            ),
            items: bannerImages.map((url) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(url,width: MediaQuery.of(context).size.width),
                  // child: Image.network(
                  //   url,
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  // ),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sampleProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: sampleProducts[index]);
              },
            ),
          ),
    SizedBox(
    height: 100,
    child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: profiles.length,
    separatorBuilder: (context, index) =>
    const SizedBox(width: 8),
    itemBuilder: (context, index) {
    final reviewer = profiles[index];
    return _buildProfileCircle(
    name: reviewer['name'] ?? '',
    imageUrl: reviewer['imageUrl'] ?? '',
    );
    },
    ),
    ),

    Container(
    // Give some padding and a light background color
    color: Colors.grey.shade100,
    padding: const EdgeInsets.all(16.0),
    // Wrap in SafeArea if you want to avoid notches on mobile devices
    child: SafeArea(
    child: Column(
    mainAxisSize: MainAxisSize.min, // Shrinks to fit content
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Company Name
    const Text(
    'LOGO Inc.',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ),
    ),
    const SizedBox(height: 12),

    // Row of links
    Row(
    children: [
    _buildFooterLink('About Us'),
    _buildSeparator(),
    _buildFooterLink('Careers'),
    _buildSeparator(),
    _buildFooterLink('Tech Blog'),
    _buildSeparator(),
    _buildFooterLink('Review Copyright'),
    ],
    ),
    const SizedBox(height: 12),

    // Email + Language Dropdown
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    const Text('review@logo.com'),
    // Simple language dropdown
    DropdownButton<String>(
    value: 'ENG',
    icon: const Icon(Icons.keyboard_arrow_down),
    items: <String>['ENG', 'KOR'].map((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    onChanged: (value) {
    // handle language change here
    },
    ),
    ],
    ),
    const SizedBox(height: 16),

    // Copyright
    const Text(
    '©2022-2022 LOGO Lab, Inc. Some Address, Seoul, South Korea',
    style: TextStyle(fontSize: 12, color: Colors.grey),
    ),
    ],
    ),
    ),
    ),
        ],
      ),
    );
  }
}

/// A circular avatar + name for "best reviewer"
Widget _buildProfileCircle({
  required String name,
  required String imageUrl,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imageUrl),
      ),
      const SizedBox(height: 4),
      Text(
        name,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}


/// Separator (e.g., a small dot or vertical bar)
Widget _buildSeparator() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    child: Text('|', style: TextStyle(color: Colors.grey)),
  );
}

Widget _buildFooterLink(String text){
  return GestureDetector(
  onTap: () {
  // handle link tap, e.g. navigate to a new page
  },
  child: Text(
  text,
  style: const TextStyle(
  fontSize: 14,
  color: Colors.black87,
  decoration: TextDecoration.underline,
  ),
  ),
  );
}

// Product Card Widget
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),

              ),
              child: Image.asset(product.imageUrl),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(product.description),
                  Text(
                    '₩${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(color: Colors.green),
                  ),
                  if (product.isTop10)
                    const Chip(
                      label: Text('Top 10'),
                      backgroundColor: Colors.orange,
                    ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: const Text('상세 보기'),
            ),
          ],
        ),
      ),
    );
  }
}

// Product Detail Screen
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null, // Search functionality can be added later
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(product.description),
                  const SizedBox(height: 10),
                  Text(
                    '₩${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  if (product.isTop10) ...[
                    const SizedBox(height: 10),
                    const Chip(
                      label: Text('Top 10'),
                      backgroundColor: Colors.orange,
                    ),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart functionality can be added here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('장바구니에 추가됨')),
                      );
                    },
                    child: const Text('장바구니에 추가'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null, // Search functionality can be added later
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(sampleUser.profileImageUrl),
            ),
            const SizedBox(height: 10),
            Text(
              sampleUser.username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('이메일'),
              subtitle: Text('name01@example.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('전화번호'),
              subtitle: Text('123-456-7890'),
            ),
            const SizedBox(height: 20),
            const Text(
              '내 제품',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2, // Show only 2 products as per design
              itemBuilder: (context, index) {
                final product = sampleProducts[index + 2]; // Use last 2 products
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(product.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.description),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Text('4.7'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}