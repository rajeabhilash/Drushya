import 'package:Drushya/landing/configure_playlist.dart';
import 'package:Drushya/landing/media_player.dart';
import 'package:flutter/material.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Playing Your Favorite'),
        content: const Text(
          'We have Configured Default Playlist\n'
          'This will take 26 Minutes\n'
          'You can also modify the Playlist\n',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Edit'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfigurePlaylist(),
                ),
              );
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
                foregroundColor: Colors.black,
                backgroundColor: Colors.teal),
            child: const Text('Play'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MediaPlayer(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
