import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({
    super.key,
    this.length = 4,
    this.boxSize = 60,
    this.boxSpacing = 12,
    this.boxDecoration,
    this.textStyle,
    required this.onCompleted,
  });

  final int length;
  final double boxSize;
  final double boxSpacing;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final void Function(String code) onCompleted;

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_focusNodes.isNotEmpty) _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _checkComplete() {
    final code = _controllers.map((c) => c.text).join();
    if (code.length == widget.length && !code.contains('')) {
      widget.onCompleted(code);
    }
  }

  void _handlePaste(String pasted) {
    final digitsOnly = pasted.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.isEmpty) return;
    for (var i = 0; i < widget.length; i++) {
      final ch = i < digitsOnly.length ? digitsOnly[i] : '';
      _controllers[i].text = ch;
    }
    final pos = digitsOnly.length >= widget.length
        ? widget.length - 1
        : digitsOnly.length;
    _focusNodes[pos.clamp(0, widget.length - 1)].requestFocus();
    _checkComplete();
  }

  @override
  Widget build(BuildContext context) {
    final defaultDecoration =
        widget.boxDecoration ??
        BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        );

    final defaultTextStyle =
        widget.textStyle ??
        Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.boxSpacing / 2),
          child: SizedBox(
            width: widget.boxSize,
            height: widget.boxSize,
            child: KeyboardListener(
              focusNode: FocusNode(skipTraversal: true),
              onKeyEvent: (event) {
                // Handle backspace when the field is empty
                if (event is KeyDownEvent &&
                    event.logicalKey == LogicalKeyboardKey.backspace) {
                  if (_controllers[index].text.isEmpty && index > 0) {
                    _focusNodes[index - 1].requestFocus();
                    _controllers[index - 1].text = '';
                  }
                }
              },
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: defaultTextStyle,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  counterText: '',
                  hintText: '*',
                  filled: true,
                  fillColor: defaultDecoration.color,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        (defaultDecoration.borderRadius as BorderRadius?) ??
                        BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  if (value.length > 1) {
                    _handlePaste(value);
                    return;
                  }

                  if (value.isNotEmpty) {
                    if (index + 1 != widget.length) {
                      _focusNodes[index + 1].requestFocus();
                    } else {
                      _focusNodes[index].unfocus();
                    }
                  }

                  _checkComplete();
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
