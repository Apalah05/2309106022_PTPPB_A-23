import 'package:flutter/material.dart';
import 'login_screen.dart';

class Swipescreen extends StatefulWidget {
  const Swipescreen({super.key});

  @override
  State<Swipescreen> createState() => _SwipescreenState();
}

class _SwipescreenState extends State<Swipescreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<SwipescreenItem> _SwipescreenData = [
    SwipescreenItem(
      title: "Jelajahi Barang Antik yang jarang diyemui",
      description: "Temukan keunikan barang antik yang dari muka bumi ini",
      button1: "Lanjut",
      button2: "Mulai",
    ),
    SwipescreenItem(
      title: "Pengantaran yang terjamin",
      description: "Dari penanganan professional untuk menjamin pengantaran barang antik yang telah didapat sampai ke tangan klien",
      button1: "Lanjut",
      button2: "Mulai",
    ),
    SwipescreenItem(
      title: "Ketok Harga",
      description: "Pelelangan barang antik dari yang mudah dijumpai hingga barang premium yang sangat langka",
      button1: "Siap Eksplorasi",
      button2: "Mulai",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _SwipescreenData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _buildSwipescreenPage(_SwipescreenData[index]);
              },
            ),
          ),
          _buildIndicator(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      if (_currentPage < _SwipescreenData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: const BorderSide(color: Colors.black),
                    ),
                    child: Text(
                      _SwipescreenData[_currentPage].button1,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(_SwipescreenData[_currentPage].button2),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSwipescreenPage(SwipescreenItem item) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder untuk gambar barang antik
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[400]!, width: 2),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_SwipescreenData.length, (index) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.black : Colors.grey[300],
          ),
        );
      }),
    );
  }
}

class SwipescreenItem {
  final String title;
  final String description;
  final String button1;
  final String button2;

  SwipescreenItem({
    required this.title,
    required this.description,
    required this.button1,
    required this.button2,
  });
}