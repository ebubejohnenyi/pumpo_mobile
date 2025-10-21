import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.label,
    required this.hintText,
    required this.onValidate,
    required this.onSaved,
    required this.icon,
    this.obscureText,
    this.suffixIconOnClick,
    this.variant = 'primary',
  });
  final String hintText;
  final String? label;
  final FormFieldValidator<String> onValidate;
  final FormFieldSetter<String> onSaved;
  final IconData icon;
  final bool? obscureText;
  final void Function()? suffixIconOnClick;
  final String? variant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(label!, style: Theme.of(context).textTheme.titleMedium)
            : SizedBox(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        TextFormField(
          obscureText:
              hintText == 'Password' ||
                  hintText == 'Confirm Password' ||
                  hintText == 'Create Password'
              ? obscureText!
              : false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon, color: Colors.grey),
            suffixIcon:
                hintText == 'Password' ||
                    hintText == 'Confirm Password' ||
                    hintText == 'Create Password'
                ? IconButton(
                    onPressed: suffixIconOnClick!,
                    icon: Icon(
                      color: Colors.grey,
                      obscureText!
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  )
                : SizedBox(),
            filled: true,
            fillColor: variant == 'primary' ? Colors.grey[100] : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 16),
          ),
          validator: onValidate,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
