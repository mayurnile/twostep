import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final bool isSuffix;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  InputField({
    required this.label,
    required this.icon,
    required this.obscureText,
    required this.isSuffix,
    this.onSaved,
    this.validator,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12.0,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            //icon
            Icon(
              widget.icon,
              color: Colors.black.withOpacity(0.75),
              size: 26.0,
            ),
            //spacing
            SizedBox(width: 18.0),
            //seperator
            VerticalDivider(
              thickness: 2.0,
              width: 1,
              endIndent: 18.0,
              indent: 18.0,
            ),
            //spacing
            SizedBox(width: 18.0),
            //text field
            Flexible(
              child: TextFormField(
                style: textTheme.headline2,
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: widget.label,
                  labelStyle: textTheme.headline4!.copyWith(
                    fontSize: 18.0,
                  ),
                  border: InputBorder.none,
                ),
                onSaved: widget.onSaved,
                validator: widget.validator,
              ),
            ),
            //show / hide password button
            widget.isSuffix
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.remove_red_eye,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
