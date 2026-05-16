import 'dart:io';

// ── Fake Data Models ──
class Profile {
  final String id;
  final String name;
  Profile(this.id, this.name);
}

class Post {
  final String title;
  Post(this.title);
}

// ── Fake Functions ──
Future<String> login(String email, String password) =>
    Future.delayed(Duration(seconds: 1), () {
      if (email == "ferdaush@gmail.com" && password == "1234") {
        return "USER_001";
      } else {
        throw Exception("Login Failed! Email বা Password ভুল");
      }
    });

Future<Profile> loadProfile(String userId) =>
    Future.delayed(Duration(seconds: 1), () {
      if (userId == "USER_001") {
        return Profile("P_001", "Ferdaush");
      } else {
        throw Exception("Profile পাওয়া যায়নি");
      }
    });

Future<List<Post>> loadPosts(String profileId) =>
    Future.delayed(Duration(seconds: 1), () {
      if (profileId == "P_001") {
        return [
          Post("Dart Future শিখছি"),
          Post("Async/Await অনেক সহজ"),
          Post("Flutter শুরু করবো"),
        ];
      } else {
        throw Exception("Posts পাওয়া যায়নি");
      }
    });

void render(Profile profile, List<Post> posts) {
  print("\n👤 Profile: ${profile.name}");
  print("📝 Posts:");
  for (var post in posts) {
    print("   - ${post.title}");
  }
}

// ── Main ──
void main() async {
  print("Email: ");
  String email = stdin.readLineSync() ?? "";

  print("Password: ");
  String password = stdin.readLineSync() ?? "";

  print("\nLoading...");

  try {
    var userId  = await login(email, password);
    print("✅ Login সফল! UserId: $userId");

    var profile = await loadProfile(userId);
    print("✅ Profile লোড হয়েছে: ${profile.name}");

    var posts   = await loadPosts(profile.id);
    print("✅ Posts লোড হয়েছে: ${posts.length}টি");

    render(profile, posts);

  } on Exception catch (e) {
    print("\n❌ Something failed: $e");
  }
}