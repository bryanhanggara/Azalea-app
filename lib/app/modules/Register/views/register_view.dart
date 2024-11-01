import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background/bg-auth.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Scrollable Form
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register Your Account",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          DView.spaceHeight(20),
                          // Username Field
                          _buildTextField(label: "Username", hint: "Username"),
                          DView.spaceHeight(15),
                          // Name Field
                          _buildTextField(label: "Name", hint: "Name"),
                          DView.spaceHeight(15),
                          // Address Field
                          _buildTextField(label: "Address", hint: "Address"),
                          DView.spaceHeight(15),
                          // Phone Number Field
                          _buildTextField(
                              label: "Phone Number", hint: "Phone Number"),
                          DView.spaceHeight(15),
                          // Password Field
                          _buildTextField(
                            label: "Password",
                            hint: "Password",
                            obscureText: true,
                          ),
                          DView.spaceHeight(20),
                          // Register Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          // Login Link
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text("Belum punya akun?"),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Daftar"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Text Field Builder
  Widget _buildTextField({
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DView.spaceHeight(5),
        Container(
          height: 50,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
