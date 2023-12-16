import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CalendarController _controller = CalendarController();
  // Set of String is required for selected property of SegmentedButton
  Set<String> selected = {'day'};
  @override
  Widget build(BuildContext context) {
    _controller.view = CalendarView.month;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segmented Button'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: SfCalendar(
                  controller: _controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
