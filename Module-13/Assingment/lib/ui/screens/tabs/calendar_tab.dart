import 'package:flutter/material.dart';
import '../../../data/models/network_response.dart';
import '../../../data/models/task_model.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../../widgets/task_card_widget.dart';

class CalendarTab extends StatefulWidget {
  const CalendarTab({super.key});

  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  final List<DateTime> _dates = [];
  late DateTime _selectedDate;
  final List<TaskModel> _allTasks = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _generateDates();
    _loadTasks();
  }

  void _generateDates() {
    // Generate dates: 7 days before and 7 days after today
    final today = DateTime.now();
    for (int i = -7; i <= 7; i++) {
      _dates.add(today.add(Duration(days: i)));
    }
  }

  Future<void> _loadTasks() async {
    setState(() {
      _isLoading = true;
    });

    final List<NetworkResponse> responses = await Future.wait([
      NetworkCaller.getRequest(Urls.listTaskByStatus('New')),
      NetworkCaller.getRequest(Urls.listTaskByStatus('Progress')),
      NetworkCaller.getRequest(Urls.listTaskByStatus('Completed')),
      NetworkCaller.getRequest(Urls.listTaskByStatus('Cancelled')),
    ]);

    _allTasks.clear();
    for (var response in responses) {
      if (response.isSuccess) {
        final taskList = TaskListModel.fromJson(response.responseData);
        if (taskList.data != null) {
          _allTasks.addAll(taskList.data!);
        }
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  List<TaskModel> get _filteredTasks {
    return _allTasks.where((task) {
      if (task.createdDate == null) return false;
      try {
        // Parse date. Format in API is typically ISO string or simple YYYY-MM-DD
        // E.g. "2026-07-16"
        final DateTime taskDate = DateTime.parse(task.createdDate!.split('T').first);
        return taskDate.year == _selectedDate.year &&
            taskDate.month == _selectedDate.month &&
            taskDate.day == _selectedDate.day;
      } catch (e) {
        return false;
      }
    }).toList();
  }

  String _getWeekdayName(int weekday) {
    const list = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return list[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Column(
        children: [
          // Horizontal Date-Strip Header
          Container(
            height: 96,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _dates.length,
              itemBuilder: (context, index) {
                final date = _dates[index];
                final isSelected = date.day == _selectedDate.day &&
                    date.month == _selectedDate.month &&
                    date.year == _selectedDate.year;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  child: Container(
                    width: 56,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF21b573) : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getWeekdayName(date.weekday),
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? Colors.white70 : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black85,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Task List for Selected Date
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator(color: Color(0xFF21b573)))
                : RefreshIndicator(
                    color: const Color(0xFF21b573),
                    onRefresh: _loadTasks,
                    child: _filteredTasks.isEmpty
                        ? ListView(
                            children: const [
                              SizedBox(height: 100),
                              Center(
                                child: Text(
                                  'No tasks scheduled for this day!',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: _filteredTasks.length,
                            itemBuilder: (context, index) {
                              return TaskCardWidget(
                                taskModel: _filteredTasks[index],
                                onRefresh: _loadTasks,
                              );
                            },
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}
