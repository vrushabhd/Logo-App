import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

// Product Model
class Product {
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final bool isTop10;
  final String rating;

  Product({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    this.isTop10 = false,
    required this.rating,
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
      rating: "4.9"),
  Product(
      imageUrl: 'assets/smart_tv.png',
      name: 'Notebook',
      description: 'Latest High-performance Laptop',
      price: 1000000,
      isTop10: true,
      rating: "4.1"),
  Product(
      imageUrl: 'assets/4k.png',
      name: 'Beer and Snack',
      description: 'Delicious Beer and Snack Set',
      price: 15000,
      rating: "4.6"),
  Product(
      imageUrl: 'assets/lg_stand_tv.png',
      name: 'AMD Processor',
      description: 'High-performance AMD Processor',
      price: 300000,
      rating: "3.6"),
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
  String defaultnameValue = "Name01";
  String defaultimageUrl = "assets/cat1.png";

  final List<Widget> _screens = [
    const HomeScreen(),
    const Placeholder(), // Categories
    // const Placeholder(), // Cart
    const Placeholder(), // Notifications
    const Placeholder(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 3) {
      // Index for ProfileScreen (Profile tab)
      print("Profile screen tab clicked!");
      // Add any additional actions for the profile tab here.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile '),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        iconSize: 30,
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
        elevation: 4,
        title: const Text(
          'LOGO',
          style: TextStyle(color: Color(0xFF5D5FEF)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    child: Image.asset(url,
                        width: MediaQuery.of(context).size.width),
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
              child: Container(
                // Outer container draws the gradient as a "border"
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF64D2FF),
                      Color(0xFF4F84FF)
                    ], // Example gradient
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                // This padding thickness is your "border" width
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  // Inner container for the solid background
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      suffixIcon: const Icon(Icons.search),
                      border: InputBorder.none, // Remove default border
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: sampleProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: sampleProducts[index]);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5),
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: profiles.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final reviewer = profiles[index];
                  return buildProfileCircle(
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
      ),
    );
  }
}

/// A circular avatar + name for "best reviewer"
Widget buildProfileCircle({
  required String name,
  required String imageUrl,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          Get.to(ProfileScreen(
            name: name,
            imageUrl: imageUrl,
            selectedIndex: 0,
          ));
        },
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imageUrl),
        ),
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

Widget _buildFooterLink(String text) {
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
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text(product.rating),
                    ],
                  ),
                  if (product.isTop10)
                    const Chip(
                      label: Text('Top 10'),
                      backgroundColor: Colors.orange,
                    ),
                ],
              ),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ProductDetailScreen(product: product),
            //       ),
            //     );
            //   },
            //   child: const Text('상세 보기'),
            // ),
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
  String name;
  String imageUrl;
  int selectedIndex;
  String defaultnameValue = "Name01";
  String defaultimageUrl = "assets/cat1.png";

  // const ProfileScreen(String name,String imageUrl);
  ProfileScreen(
      {required this.name,
      required this.imageUrl,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Custom AppBar
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              // Handle back navigation
              Get.back();
            },
          ),
          centerTitle: true,
          title: Column(
            children: const [
              Text(
                'Main #1',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                'Best Reviewer',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // Make icon colors black
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile Section
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                  child: Column(
                    children: [
                      // Cat Image
                      CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              selectedIndex == 3 ? defaultimageUrl : imageUrl)),
                      const SizedBox(height: 8),
                      // Name + Gold Badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedIndex == 3 ? defaultnameValue : name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Gold',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Operating an assembly company and writing reviews.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                const Divider(),

                // Section Header
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total 35 reviews written',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButton<String>(
                        value: 'Sort By',
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: <String>['Sort By', 'Rating', 'A-Z']
                            .map((String value) {
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
                ),

                // Review Card (Product)
                buildProductReviewCard(context, imageUrl),

                // User Review Details
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: buildUserReview(context, name, imageUrl),
                ),
              ],
            ),
          ),
        ));
  }

// Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('프로필'),
  //       actions: const [
  //         IconButton(
  //           icon: Icon(Icons.search),
  //           onPressed: null, // Search functionality can be added later
  //         ),
  //       ],
  //     ),
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           const SizedBox(height: 20),
  //           CircleAvatar(
  //             radius: 50,
  //             backgroundImage: NetworkImage(sampleUser.profileImageUrl),
  //           ),
  //           const SizedBox(height: 10),
  //           Text(
  //             sampleUser.username,
  //             style: const TextStyle(
  //               fontSize: 24,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           const SizedBox(height: 20),
  //           const ListTile(
  //             leading: Icon(Icons.email),
  //             title: Text('이메일'),
  //             subtitle: Text('name01@example.com'),
  //           ),
  //           const ListTile(
  //             leading: Icon(Icons.phone),
  //             title: Text('전화번호'),
  //             subtitle: Text('123-456-7890'),
  //           ),
  //           const SizedBox(height: 20),
  //           const Text(
  //             '내 제품',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //           ListView.builder(
  //             shrinkWrap: true,
  //             physics: const NeverScrollableScrollPhysics(),
  //             itemCount: 2, // Show only 2 products as per design
  //             itemBuilder: (context, index) {
  //               final product =
  //                   sampleProducts[index + 2]; // Use last 2 products
  //               return Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 4.0),
  //                 child: ListTile(
  //                   leading: Container(
  //                     width: 50,
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(8.0),
  //                       image: DecorationImage(
  //                         image: NetworkImage(product.imageUrl),
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),
  //                   ),
  //                   title: Text(product.name),
  //                   subtitle: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(product.description),
  //                       const Row(
  //                         children: [
  //                           Icon(Icons.star, color: Colors.yellow, size: 16),
  //                           Text('4.7'),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /// Example "review card" for the product
  Widget buildProductReviewCard(BuildContext context, String imageUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/ryzen_cpu.png",
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                )
                // Image.network(
                //  imageUrl,
                //   width: 80,
                //   height: 80,
                //   fit: BoxFit.cover,
                // ),
                ),
            const SizedBox(width: 12),
            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AMD Ryzen 5 5600X Vermeer (Genuine Multipack)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      // Star Icon + Rating
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      Text(
                        '4.07',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Example of a single user review item
  Widget buildUserReview(BuildContext context, String name, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User row: avatar + name + date
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(imageUrl),
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text(
                '2022.12.09',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Review text
          const Text(
            'Teddy was assembled neatly and worked well. It is also suitable to recommend to the customers of this company.\n\n'
            'It slightly loads the CPU temperature. The BIOS is not that big of a deal.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          // Optional: Horizontal list of images or a single image
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildReviewImage('assets/review_1.png'),
                const SizedBox(width: 8),
                buildReviewImage('assets/review_2.png'),
                const SizedBox(width: 8),
                buildReviewImage('assets/review_3.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Helper to build small images in the review
  Widget buildReviewImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        url,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
