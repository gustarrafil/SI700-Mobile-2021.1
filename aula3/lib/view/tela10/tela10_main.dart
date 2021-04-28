import 'package:flutter/material.dart';

class MainTela10 extends StatelessWidget {
  final List icons = [
    Icons.cake,
    Icons.calendar_view_day,
    Icons.accessible_forward,
    Icons.account_box
  ];
  final List texto = [
    "Ulisses",
    "Guilherme",
    "Meira",
    "André",
    "Ana",
    "Gisele",
    "Lubi",
    "Ieda"
  ];

  final List colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.grey,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      //child: generateBasicListView(),
      child: efficientlyGenerateListView(),
    );
  }

  Widget generateBasicListView() {
    return ListView(
      children: [
        Card(
          color: Colors.blue,
          elevation: 5,
          child: ListTile(
            title: Text("Gabriella Carlos do Nascimento"),
            subtitle: Text("Aluna de BSI"),
            leading: Icon(Icons.access_time),
            trailing: Icon(Icons.add_a_photo),
            onTap: () {},
          ),
        ),
        Card(
          color: Colors.redAccent[100],
          elevation: 5,
          child: ListTile(
            title: Text("Eric Satoshi Suzuki Kishimoto"),
            subtitle: Text("Aluno de BSI"),
            leading: Icon(Icons.ac_unit),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {},
            ),
            onTap: () {},
          ),
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: Text("Gabriella Carlos do Nascimento"),
          subtitle: Text("Aluna de BSI"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
          onTap: () {},
        )
      ],
    );
  }

  Widget efficientlyGenerateListView() {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amber[100],
            elevation: 10,
            child: ListTile(
              title: Text(texto[index % texto.length],
                  style: TextStyle(color: colors[index % colors.length])),
              leading: Icon(icons[index % icons.length]),
            ),
          );
        });
  }
}
