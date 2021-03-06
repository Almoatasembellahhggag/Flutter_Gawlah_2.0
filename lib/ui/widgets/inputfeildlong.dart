import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gawlah/ui/shared/shared_styles.dart';
import 'package:flutter_gawlah/ui/shared/ui_helpers.dart';

import 'note_text.dart';




class InputLongField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final Function enterPressed;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  final Function(String) onChanged;
  final TextInputFormatter formatter;
  final Color color;

  InputLongField(
      {@required this.controller,
      @required this.placeholder,
      this.enterPressed,
      this.fieldFocusNode,
      this.nextFocusNode,
      this.additionalNote,
      this.onChanged,
      this.formatter,
      this.validationMessage,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.password = false,
      this.isReadOnly = false,
      this.smallVersion = false, this.color});

  @override
  _InputFieldLongState createState() => _InputFieldLongState();
}

class _InputFieldLongState extends State<InputLongField> {
  bool isPassword;
  double fieldHeight = 300;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                  
                  
            height: widget.smallVersion ? 60: 300,
            alignment: Alignment.centerLeft,
            padding: fieldPadding,
            decoration: widget.isReadOnly ? BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.white)
 :  BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Color.fromRGBO(38, 47, 62, 1), ),

              
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
               //  style: TextStyle(color:widget.color),
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    focusNode: widget.fieldFocusNode,
                    textInputAction: widget.textInputAction,
                    onChanged: widget.onChanged,
                
                    inputFormatters:
                        widget.formatter != null ? [widget.formatter] : null,
                    //     style: TextStyle(color: Colors.white),
                    onEditingComplete: () {
                      if (widget.enterPressed != null) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        widget.enterPressed();
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (widget.nextFocusNode != null) {
                        widget.nextFocusNode.requestFocus();
                      }
                    },
                    obscureText: isPassword,
                    readOnly: widget.isReadOnly,
                    decoration: InputDecoration.collapsed(
                        hintText: widget.placeholder,
                        hintStyle:
                            TextStyle(fontSize: widget.smallVersion ? 12 : 15,color: Colors.white)),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isPassword = !isPassword;
                  }),
                  child: widget.password
                      ? Container(
                          width: fieldHeight,
                          height: fieldHeight,
                          alignment: Alignment.center,
                          child: Icon(isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,color: Colors.blue[600],))
                      : Container(),
                ),
              ],
            ),
          ),
        ),
        if (widget.validationMessage != null)
          NoteText(
            widget.validationMessage,
            color: Colors.red,
          ),
        if (widget.additionalNote != null) verticalSpace(5),
        if (widget.additionalNote != null) NoteText(widget.additionalNote),
        verticalSpaceSmall
      ],
    );
  }
}
