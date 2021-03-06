import 'package:CountDays/services/database_plan.dart';
import 'package:CountDays/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlanAddForm extends StatefulWidget {
  @override
  _PlanAddFormState createState() => _PlanAddFormState();
}

class _PlanAddFormState extends State<PlanAddForm> {
  final _formKey = GlobalKey<FormState>();

  // form values
  String _currenticon;
  String _currenttitle;
  String _currentdetail;

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              'Write your idea .',
              style: TextStyle(
                fontSize: 18.0,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: "Icon 🔥"),
              validator: (val) => val.isEmpty ? 'Please enter a icon' : null,
              onChanged: (val) => setState(() => _currenticon = val),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: "Title 🚀"),
              validator: (val) => val.isEmpty ? 'Please enter a title' : null,
              onChanged: (val) => setState(() => _currenttitle = val),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: null,
              textAlign: TextAlign.start,
              decoration: textInputDecoration.copyWith(),
              validator: (val) => val.isEmpty ? 'Please enter a detail' : null,
              onChanged: (val) => setState(() => _currentdetail = val),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  color: Colors.pink[400],
                  child: Text(
                    'Done',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await DatabaseServicePlan().createPlanData(
                        Timestamp.now(),
                        _currenttitle ?? 'Somethig went wrong',
                        _currentdetail ?? 'Somethig went wrong',
                        _currenticon ?? '🌠',
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
