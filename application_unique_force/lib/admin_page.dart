import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var cart;
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        final cartItem = cart[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            radius: 30,
          ),
        );
      },
    );
  }
}
