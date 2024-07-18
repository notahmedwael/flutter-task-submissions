import 'package:flutter/material.dart';
import '../../data/data_source/fake_store_api_source.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  ProductsScreenState createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    if (FakeStoreApiClient.products.isEmpty) {
      await FakeStoreApiClient.getProductsData();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (FakeStoreApiClient.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading...'),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Color(0XFFf96d00),
            ),
          ],
        ),
      );
    } else if (FakeStoreApiClient.errorOccurred) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${FakeStoreApiClient.errorMessage}'),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    } else {
      return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: FakeStoreApiClient.products.length,
        itemBuilder: (context, index) {
          final product = FakeStoreApiClient.products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      product.image ?? '',
                      width: 70,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFf96d00),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
