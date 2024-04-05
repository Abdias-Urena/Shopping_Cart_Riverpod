import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_model.dart';

final productListProvider = Provider<List<ItemProduct>>((ref) => [
      ItemProduct(name: 'Producto 1'),
      ItemProduct(name: 'Producto 2'),
      ItemProduct(name: 'Producto 3'),
    ]);

final cartProvider = ChangeNotifierProvider((ref) => CartModel());

class PageCompras extends ConsumerWidget {
  const PageCompras({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ItemProduct> products = ref.watch(productListProvider);
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Shopping List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/result');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ListTile(
            title: Text(item.name),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                cart.add(products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
