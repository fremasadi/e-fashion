import 'package:flutter/material.dart';

class TextFieldCard extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final TextStyle? titleStyle;

  const TextFieldCard({
    super.key,
    required this.controller,
    required this.title,
    this.titleStyle,
  });

  @override
  _TextFieldCardState createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
  bool _isFilled = false;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _isFilled = widget.controller.text.isNotEmpty;
      });
    });

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _focusNode.hasFocus ? Colors.purple : Colors.white,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: widget.title,
                  labelStyle: widget.titleStyle,
                  // Mengatur gaya teks dari title
                  border: InputBorder.none,
                ),
                cursorColor: Colors.purple,
              ),
            ),
          ),
          if (_isFilled)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
        ],
      ),
    );
  }
}
