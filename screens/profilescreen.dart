import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internship_task/screens/login.dart';
import 'package:internship_task/screens/customerscreen.dart'; // ADD THIS IMPORT
import 'package:internship_task/service/authservices.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  final bool isAdmin;
  final AuthService authService;

  ProfileScreen({
    required this.user,
    required this.isAdmin,
    required this.authService,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _logout() async {
    await widget.authService.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
      (route) => false,
    );
  }

  void _navigateToManageCustomers() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ManageCustomersScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Email: ${widget.user.email}',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              'Name: ${widget.user.displayName ?? 'Not set'}',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              'Role: ${widget.isAdmin ? 'Admin' : 'Customer'}',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 30.h),
            if (widget.isAdmin)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _navigateToManageCustomers, // UPDATED THIS LINE
                    child: Text('Manage Customers'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.h),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50.h),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
