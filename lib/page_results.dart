import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carrito_compras/page_shopping.dart';

class PageResult extends ConsumerWidget {
  const PageResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Shopping Cart'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cart.remove(item);
                      },
                    )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
