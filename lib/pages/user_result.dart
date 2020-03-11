import 'package:flutter/material.dart';
import 'package:social_network/models/user.dart';

class UserResult extends StatelessWidget {
  final User user;
  UserResult(this.user);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => print('tapped'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  // backgroundImage: CachedNetworkImageProvider(user.photoUrl,),
                  backgroundImage: NetworkImage(user.photoUrl),
                  maxRadius: 30,
                ),
                title: Text(
                  user.displayName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  user.username,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}
