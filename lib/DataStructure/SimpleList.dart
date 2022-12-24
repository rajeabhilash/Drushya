import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({Key? key, required this.product}) : super(key: key);
  final List<String> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
      child: ListView.separated(
        itemCount: product.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xff764abc),
              child: Text(product[index]),
            ),
            subtitle: Text('This is Description Line at the Index ${product[index]}'),
            title: Text('Title Indexed at ${product[index]}'),
            trailing: IconButton(onPressed:(){}, icon: Icon(Icons.more_vert)),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
