import 'package:Drushya/landing/item_details.dart';
import 'package:Drushya/landing/show_config_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class LandedPage extends StatefulWidget {
  const LandedPage({super.key});

  @override
  State<LandedPage> createState() => _LandedPageState();
}

class _LandedPageState extends State<LandedPage> {
  int _selectedIndex = 0;
  List<Sutras> itemList = [];

  @override
  void initState() {
    super.initState();
    loadItemList();
  }

  void loadItemList() {
    final savedItemList = html.window.localStorage['itemList'];

    if (savedItemList != null && savedItemList.isNotEmpty) {
      final itemDataList = savedItemList.split(',');

      for (var i = 0; i < itemDataList.length; i += 4) {
        final name = itemDataList[i];
        final duration = int.parse(itemDataList[i + 1]);
        final difficulty = itemDataList[i + 2];
        final iconCode = int.parse(itemDataList[i + 3]);

        final listItem = Sutras(
          name: name,
          duration: duration,
          difficulty: difficulty,
          icon: IconData(iconCode, fontFamily: 'MaterialIcons'),
        );

        itemList.add(listItem);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Drushya",
          style: GoogleFonts.righteous(fontSize: 30),
        ),
        elevation: 3,
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            backgroundColor: AppBarTheme.of(context).backgroundColor,
            destinations: const <NavigationRailDestination>[
              // navigation destinations
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Wishlist'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person),
                label: Text('Account'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart),
                label: Text('Cart'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 2),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(itemList[index].icon),
                  title: Text(itemList[index].name),
                  subtitle: Text(
                      'Duration: ${itemList[index].duration} Minutes, Difficulty: ${itemList[index].difficulty}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Remove the item from the list
                      setState(() {
                        itemList.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {},
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //show dialog box here
          dialogBuilder(context);
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
