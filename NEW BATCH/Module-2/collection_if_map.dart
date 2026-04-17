void main(){
  bool showEmail = true;
  bool showPhone = false;

  Map<String, String> contact = {
    "name": "Ayaan",
    if (showEmail) "email": "ayaan@ex.com",
    if (showPhone) "phone": "017xxxxxxxx",
  };

  print(contact);
}