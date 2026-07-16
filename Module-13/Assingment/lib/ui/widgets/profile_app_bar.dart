import 'dart:convert';
import 'package:flutter/material.dart';
import '../../data/utils/auth_utility.dart';
import '../screens/login_screen.dart';
import '../screens/update_profile_screen.dart';

PreferredSizeWidget get profileAppBar {
  return AppBar(
    backgroundColor: const Color(0xFF21b573),
    automaticallyImplyLeading: false, // Prevents back button on main screens
    title: Builder(
      builder: (context) {
        final user = AuthUtility.userInfo;
        final photo = user?.photo;

        ImageProvider? avatarImage;
        if (photo != null && photo.isNotEmpty) {
          try {
            // Strip standard base64 data prefix if present (e.g. data:image/png;base64,)
            final String cleanBase64 = photo.contains(',') ? photo.split(',').last : photo;
            avatarImage = MemoryImage(base64Decode(cleanBase64.trim()));
          } catch (e) {
            avatarImage = null;
          }
        }

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpdateProfileScreen(),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: avatarImage,
                child: avatarImage == null
                    ? const Icon(
                        Icons.person,
                        color: Color(0xFF21b573),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      user?.email ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
    actions: [
      Builder(
        builder: (context) {
          return IconButton(
            onPressed: () async {
              await AuthUtility.clearUserInfo();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          );
        },
      )
    ],
  );
}
