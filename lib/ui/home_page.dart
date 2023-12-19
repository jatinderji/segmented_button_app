import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CalendarController _controller = CalendarController();
  Set<String> selected = {'day'};
  @override
  Widget build(BuildContext context) {
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
              SegmentedButton(
                segments: const [
                  ButtonSegment(
                    value: 'day',
                    label: Text('Day'),
                    icon: Icon(Icons.calendar_view_day),
                  ),
                  ButtonSegment(
                    value: 'week',
                    label: Text('Week'),
                    icon: Icon(Icons.calendar_view_week),
                  ),
                  ButtonSegment(
                    value: 'month',
                    label: Text('Month'),
                    icon: Icon(Icons.calendar_view_month),
                  ),
                ],
                selected: selected,
                onSelectionChanged: (Set<String> newSelected) {
                  setState(() {
                    selected = newSelected;
                  });
                  if (selected.first == 'day') {
                    _controller.view = CalendarView.day;
                  } else if (selected.first == 'week') {
                    _controller.view = CalendarView.week;
                  } else {
                    _controller.view = CalendarView.month;
                  }
                },
              ),
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
