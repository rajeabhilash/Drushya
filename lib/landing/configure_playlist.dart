import 'package:Drushya/landing/item_details.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class ConfigurePlaylist extends StatefulWidget {
  const ConfigurePlaylist({super.key});

  @override
  State<ConfigurePlaylist> createState() => _ConfigurePlaylistState();
}

class _ConfigurePlaylistState extends State<ConfigurePlaylist> {
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

  void saveItemList() {
    final itemDataList = itemList
        .map((item) =>
            '${item.name},${item.duration},${item.difficulty},${item.icon.codePoint}')
        .toList();

    final savedItemList = itemDataList.join(',');

    html.window.localStorage['itemList'] = savedItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Playlist"),
      ),
      body: ListView.builder(
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
            onTap: () {
              // Handle item tap event (e.g., navigate to detail screen)
              _showUpdateItemDialog(itemList[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog();
          // showMenuItems(context);
        },
        child: const Icon(Icons.playlist_add),
      ),
    );
  }

  void _showAddItemDialog() {
    String name = '';
    int duration = 0;
    String difficulty = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              SliderTheme(
                data: SliderThemeData(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
                  trackHeight: 4,
                  activeTrackColor: Colors.teal,
                  inactiveTrackColor: Colors.teal[100],
                  thumbColor: Colors.teal,
                  overlayColor: Colors.teal.withOpacity(0.3),
                  valueIndicatorColor: Colors.teal,
                ),
                child: Slider(
                  value: duration.toDouble(),
                  min: 0,
                  max: 60,
                  divisions: 12,
                  label: '$duration min',
                  onChanged: (value) {
                    setState(() {
                      duration = value.toInt();
                    });
                  },
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Difficulty'),
                onChanged: (value) {
                  difficulty = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                // Create a new item and add it to the list
                setState(() {
                  itemList.add(
                    Sutras(
                        name: name,
                        duration: duration,
                        difficulty: difficulty,
                        icon: Icons.label),
                  );
                });
                saveItemList();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showUpdateItemDialog(Sutras item) {
    String name = item.name;
    int duration = item.duration;
    String difficulty = item.difficulty;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
                controller: TextEditingController(text: name),
              ),
              SliderTheme(
                data: SliderThemeData(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
                  trackHeight: 4,
                  activeTrackColor: Colors.teal,
                  inactiveTrackColor: Colors.teal[100],
                  thumbColor: Colors.teal,
                  overlayColor: Colors.teal.withOpacity(0.3),
                  valueIndicatorColor: Colors.teal,
                ),
                child: Slider(
                  value: duration.toDouble(),
                  min: 0,
                  max: 60,
                  divisions: 12,
                  label: '$duration min',
                  onChanged: (value) {
                    setState(() {
                      duration = value.toInt();
                    });
                  },
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Difficulty'),
                onChanged: (value) {
                  difficulty = value;
                },
                controller: TextEditingController(text: difficulty),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Update'),
              onPressed: () {
                // Update the item in the list
                setState(() {
                  item.name = name;
                  item.duration = duration;
                  item.difficulty = difficulty;
                });
                saveItemList();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
