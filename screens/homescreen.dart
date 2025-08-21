import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_task/screens/profilescreen.dart';
import 'package:internship_task/service/authservices.dart';
import 'package:internship_task/widgets/restaurantcard.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();
  int _currentIndex = 0;

  final List<Map<String, String>> restaurants = [
    {
      'name': 'BFC',
      'cuisine': 'Burgers, American',
      'rating': '4.5',
      'time': '15',
      'image':
          'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=400&h=300&fit=crop',
    },
    {
      'name': 'The Shawarma Joint',
      'cuisine': 'Middle Eastern',
      'rating': '4.2',
      'time': '20',
      'image':
          'https://images.unsplash.com/photo-1633328562354-6b3553c5d5fe?w=400&h=300&fit=crop',
    },
    {
      'name': 'Pizza Palace',
      'cuisine': 'Italian, Pizza',
      'rating': '4.7',
      'time': '25',
      'image':
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&h=300&fit=crop',
    },
    {
      'name': 'Sushi Haven',
      'cuisine': 'Japanese, Sushi',
      'rating': '4.8',
      'time': '30',
      'image':
          'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400&h=300&fit=crop',
    },
    {
      'name': 'Burger King',
      'cuisine': 'Fast Food, Burgers',
      'rating': '4.0',
      'time': '18',
      'image':
          'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=400&h=300&fit=crop',
    },
  ];

 
  final List<Map<String, String>> categories = [
    {
      'name': 'Pizza',
      'image': 'https://cdn-icons-png.flaticon.com/512/6978/6978255.png',
    },
    {
      'name': 'Burger',
      'image': 'https://cdn-icons-png.flaticon.com/512/5787/5787016.png',
    },
    {
      'name': 'Sushi',
      'image': 'https://cdn-icons-png.flaticon.com/512/3081/3081985.png',
    },
    {
      'name': 'Pasta',
      'image': 'https://cdn-icons-png.flaticon.com/512/5905/5905977.png',
    },
    {
      'name': 'Salad',
      'image': 'https://cdn-icons-png.flaticon.com/512/3081/3081819.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isAdmin = _authService.isAdmin(widget.user);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              // Header with time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // App Logo from URL
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/857/857718.png',
                    height: 40.h,
                    width: 40.w,
                  ),
                  Text(
                    '9:41',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Banner Image from URL
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=600&h=150&fit=crop',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Amazing Foods!....',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for food...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              SizedBox(height: 20.h),

              // Categories Section
              Text(
                'Categories',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: _buildCategoryItem(
                        category['name']!,
                        category['image']!,
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.h),

              // Restaurants Section
              Text(
                'Restaurants near you',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.h),

              // Restaurants List
              Expanded(
                child: ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: RestaurantCard(
                        name: restaurant['name']!,
                        cuisine: restaurant['cuisine']!,
                        rating: restaurant['rating']!,
                        time: restaurant['time']!,
                        imageUrl: restaurant['image']!, // Pass URL here
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(
                  user: widget.user,
                  isAdmin: isAdmin,
                  authService: _authService,
                ),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, String imageUrl) {
    return Column(
      children: [
        // Category icon from URL
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.grey[100],
          ),
          child: Center(
            child: Image.network(
              imageUrl,
              height: 30.h,
              width: 30.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(name, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}

