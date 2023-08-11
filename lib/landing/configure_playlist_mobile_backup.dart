import 'package:Drushya/landing/item_details.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurePlaylist extends StatefulWidget {
  const ConfigurePlaylist({super.key});

  @override
  State<ConfigurePlaylist> createState() => _ConfigurePlaylistState();
}

class _ConfigurePlaylistState extends State<ConfigurePlaylist> {
  List<Sutras> itemList = [];
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
    loadItemList();
  }

  void initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void loadItemList() {
    List<String>? savedItemList = _prefs.getStringList('itemList');

    if (savedItemList != null) {
      itemList = savedItemList.map((itemString) {
        List<String> itemData = itemString.split(',');
        return Sutras(
          name: itemData[0],
          duration: int.parse(itemData[1]),
          difficulty: itemData[2],
          icon: Icons.label,
        );
      }).toList();
    }
  }

  void saveItemList() {
    List<String> itemStringList = itemList.map((item) {
      return '${item.name},${item.duration},${item.difficulty}';
    }).toList();

    _prefs.setStringList('itemList', itemStringList);
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
              Slider(
                value: duration.toDouble(),
                min: 0,
                max: 60,
                divisions: 12,
                onChanged: (value) {
                  setState(() {
                    duration = value.toInt();
                  });
                },
                label: duration.toString(),
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
              Slider(
                value: duration.toDouble(),
                min: 0,
                max: 60,
                divisions: 12,
                onChanged: (value) {
                  setState(() {
                    duration = value.toInt();
                  });
                },
                label: duration.toString(),
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
