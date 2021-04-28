import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
    String _title;
    IconData _icon;
    TabItem(String title, IconData icon) {
        _title = title;
        _icon = icon;
    }

    @override
    Widget build(BuildContext context) {
        return Tab(
            icon: Icon(_icon),
            text: _title
        );
    }
}

