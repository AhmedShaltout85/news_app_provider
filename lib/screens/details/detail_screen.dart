
import 'package:flutter/material.dart';

import '../../common_widgets/custom_drawer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    if (args == null || args is! Map) {
      return const Scaffold(
        body: Center(
          child: Text("No data received"),
        ),
      );
    }

    final data = args;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          data['appBarTitle'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['content'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data['content'],
              style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
            ),
            const SizedBox(height: 20),
            Text(
             'By  ${data['senderName']}',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 11,
                decoration: TextDecoration.underline,
              ),
            ),
            Text(data['time'], style: const TextStyle(fontSize: 11)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.one_x_mobiledata, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.message, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                data['image'],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data['content'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data['content'],
              style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
