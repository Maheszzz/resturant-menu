import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia',
        primaryColor: Colors.indigo[800],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo[600],
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'The Western Grill',
            style: TextStyle(
              fontFamily: 'Rockwell',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.orange[50],
            ),
          ),
          backgroundColor: Colors.indigo[900],
          elevation: 8,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/western_bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.indigo.withOpacity(0.15),
                BlendMode.overlay,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.indigo[800]!.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.deepOrange[300]!,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "Authentic Western Cuisine",
                    style: TextStyle(
                      fontFamily: 'Rockwell',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[50],
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    children: [
                      menuCategory("Signature Steaks"),
                      menuItem(
                        "Cowboy Ribeye Steak",
                        "24oz bone-in ribeye with roasted garlic butter and choice of two sides",
                        "\$34.99",
                        "photos/1.jpg",
                      ),
                      menuItem(
                        "Texas T-Bone",
                        "20oz prime T-bone steak cooked over open flame with bourbon glaze",
                        "\$32.99",
                        "photos/2.jpg",
                      ),
                      menuCategory("BBQ Specialties"),
                      menuItem(
                        "Smokehouse Ribs",
                        "Slow-smoked for 12 hours with our secret spice rub and tangy BBQ sauce",
                        "\$24.99",
                        "photos/3.jpg",
                      ),
                      menuItem(
                        "Brisket Platter",
                        "Tender smoked brisket with cornbread and coleslaw",
                        "\$19.99",
                        "photos/4.jpg",
                      ),
                      menuCategory("Ranch Favorites"),
                      menuItem(
                        "Frontier Burger",
                        "Half-pound Angus beef with aged cheddar, bacon, and onion rings",
                        "\$15.99",
                        "photos/5.jpg",
                      ),
                      menuItem(
                        "Buffalo Wings",
                        "Crispy wings tossed in spicy buffalo sauce with blue cheese dip",
                        "\$13.99",
                        "photos/6.jpg",
                      ),
                      menuCategory("Sweet Endings"),
                      menuItem(
                        "Old-Fashioned Apple Pie",
                        "Warm apple pie with cinnamon streusel and vanilla ice cream",
                        "\$8.99",
                        "photos/7.jpg",
                      ),
                      menuItem(
                        "Texas Pecan Cobbler",
                        "Rich pecan cobbler drizzled with caramel sauce",
                        "\$9.99",
                        "photos/8.jpg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuCategory(String category) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo[700]!.withOpacity(0.85),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.deepOrange[300]!, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange[50],
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.deepOrange[300],
              thickness: 1.5,
              indent: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(
    String title,
    String description,
    String price,
    String imagePath,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
        border: Border.all(color: Colors.indigo[200]!, width: 1),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
              child: Image.network(
                imagePath,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) {
                  return const Text('Image not available');
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rockwell',
                        color: Colors.indigo[900],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            price,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart, size: 18),
                          label: Text("Add"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[600],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
