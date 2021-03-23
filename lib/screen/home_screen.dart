import 'package:flutter/material.dart';
import 'package:lista_tarefas/components/my_components.dart';
import 'package:lista_tarefas/data/data.dart';
import 'package:lista_tarefas/data/data_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.taskList);

    Widget buildItem(item, int index, Animation<double> animation) =>
      MyComponents(
        item: item,
        animation: animation,
        onTap: () => removeItem(index),
      );

      void insertItem(int index, DataModel item) {
    items.insert(index, item);
    key.currentState.insertItem(index);
  }

  void removeItem(int index) {
    final item = items.removeAt(index);

    key.currentState.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text('Lista de Tarefas'),
        actions: [
          IconButton(icon: Icon(Icons.add,), onPressed: (){
            insertItem(0, Data.taskList.first );
          },),
        ]
      ),
      backgroundColor: Colors.indigo,
      body: Column(
        children:[
           Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index, animation),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
            ),
        ]
      ),
    );
  }
}

