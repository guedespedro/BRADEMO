import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScaffoldHome(),
    );
  }
}

class ScaffoldHome extends StatefulWidget {
  const ScaffoldHome({super.key});

  @override
  State<ScaffoldHome> createState() => _ScaffoldHomeState();
}

class _ScaffoldHomeState extends State<ScaffoldHome> {
  bool _showOptions = false;
  int _tabIndex = 3;

  void _toggleOptions() {
    setState(() {
      _showOptions = !_showOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar with FAB'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              'TAB: $_tabIndex',
              style: const TextStyle(fontSize: 40),
            ),
          ),
          if (_showOptions)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMiniFab(Icons.chat),
                  const SizedBox(height: 15),
                  _buildMiniFab(Icons.mail),
                  const SizedBox(height: 15),
                  _buildMiniFab(Icons.call),
                  const SizedBox(height: 80), 
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'A',
        notchedShape: const CircularNotchedRectangle(),
        color: Colors.grey,
        selectedColor: Colors.red,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
        ],
        onTabSelected: (index) => setState(() => _tabIndex = index),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleOptions,
        child: Icon(_showOptions ? Icons.close : Icons.add),
      ),
    );
  }

  Widget _buildMiniFab(IconData icon) {
    return FloatingActionButton(
      onPressed: () {},
      mini: true,
      backgroundColor: Colors.white,
      child: Icon(icon, color: Colors.blue),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, required this.text});
  final IconData iconData;
  final String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    super.key,
    required this.items,
    this.centerItemText = '',
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }

  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected?.call(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText,
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color? color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}