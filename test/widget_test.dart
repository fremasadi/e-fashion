import 'package:http/http.dart' as http;

void testConnection() async {
  try {
    final response = await http.get(Uri.parse('http://localhost:8080/users'));

    if (response.statusCode == 200) {
      print('Success: ${response.body}');
    } else {
      print('Failed: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

void main() {
  testConnection();
}
