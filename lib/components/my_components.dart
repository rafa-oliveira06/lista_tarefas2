import 'package:flutter/material.dart';
import 'package:lista_tarefas/data/data_model.dart';

class MyComponents extends StatelessWidget {
  final DataModel item;
  final Animation animation;
  final VoidCallback onTap;

  const MyComponents({Key key, this.item, this.animation, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: animation,
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            leading: Column(
              children: [
                Text(item.title, style: TextStyle(fontSize: 20),),
                Text(item.description,  style: TextStyle(fontSize: 20),)
              ],
            ),
            //title: Text(item.title, style: TextStyle(fontSize: 20)),
            trailing: IconButton(
              icon: Icon(Icons.check_circle, color: Colors.green, size: 32),
              onPressed: onTap,
            ),
          ),
        ),
      );
}