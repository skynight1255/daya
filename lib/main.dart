import 'package:flutter/material.dart';

void main() {
  runApp(DateCalculatorApp());
}

class DateCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DateCalculatorPage(),
    );
  }
}

class DateCalculatorPage extends StatefulWidget {
  @override
  _DateCalculatorPageState createState() => _DateCalculatorPageState();
}

class _DateCalculatorPageState extends State<DateCalculatorPage> {
  DateTime _startDate;
  DateTime _endDate;
  int _daysDifference;

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now();
    _daysDifference = 0;
  }

  void _calculateDaysDifference() {
    final difference = _endDate.difference(_startDate).inDays;
    setState(() {
      _daysDifference = difference;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: _startDate,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              ).then((pickedDate) {
                if (pickedDate != null) {
                  setState(() {
                    if (_startDate == _endDate) {
                      _startDate = pickedDate;
                    } else {
                      _endDate = pickedDate;
                    }
                  });
                }
              });
            },
            child: Text('Select Date'),
          ),
          SizedBox(height: 16),
          Text(
            'Start Date: ${_startDate.toString().substring(0, 10)}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'End Date: ${_endDate.toString().substring(0, 10)}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _calculateDaysDifference,
            child: Text('Calculate Days'),
          ),
          SizedBox(height: 16),
          Text(
            'Days Difference: $_daysDifference',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}




