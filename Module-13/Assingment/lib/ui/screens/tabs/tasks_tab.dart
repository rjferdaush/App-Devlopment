import 'package:flutter/material.dart';
import '../../../data/models/network_response.dart';
import '../../../data/models/task_model.dart';
import '../../../data/models/task_status_count_model.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../../widgets/task_card_widget.dart';
import '../add_new_task_screen.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  bool _countsInProgress = false;
  bool _tasksInProgress = false;
  List<TaskStatusCount> _statusCounts = [];
  final List<TaskModel> _allTasks = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _loadStatusCounts();
    _loadAllTasks();
  }

  Future<void> _loadStatusCounts() async {
    setState(() {
      _countsInProgress = true;
    });
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.taskStatusCount);
    setState(() {
      _countsInProgress = false;
    });

    if (response.isSuccess) {
      final countModel = TaskStatusCountListModel.fromJson(response.responseData);
      _statusCounts = countModel.data ?? [];
    }
  }

  Future<void> _loadAllTasks() async {
    setState(() {
      _tasksInProgress = true;
    });

    // Fetch tasks from all status categories in parallel
    final List<NetworkResponse> responses = await Future.wait([
      NetworkCaller.getRequest(Urls.listTaskByStatus('New')),
      NetworkCaller.getRequest(Urls.listTaskByStatus('Progress')),
      NetworkCaller.getRequest(Urls.listTaskByStatus('Completed')),
      NetworkCaller.getRequest(Urls.listTaskByStatus('Cancelled')),
    ]);

    _allTasks.clear();
    for (var response in responses) {
      if (response.isSuccess) {
        final taskListModel = TaskListModel.fromJson(response.responseData);
        if (taskListModel.data != null) {
          _allTasks.addAll(taskListModel.data!);
        }
      }
    }

    // Sort tasks by created date (newest first)
    _allTasks.sort((a, b) {
      final aDate = a.createdDate ?? '';
      final bDate = b.createdDate ?? '';
      return bDate.compareTo(aDate);
    });

    setState(() {
      _tasksInProgress = false;
    });
  }

  int _getCountByStatus(String status) {
    for (var count in _statusCounts) {
      if (count.sId?.toLowerCase() == status.toLowerCase()) {
        return count.sum ?? 0;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final int newCount = _getCountByStatus('New');
    final int progressCount = _getCountByStatus('Progress');
    final int completedCount = _getCountByStatus('Completed');
    final int cancelledCount = _getCountByStatus('Cancelled');

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Column(
        children: [
          // Status Counts Header Row
          _countsInProgress
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: LinearProgressIndicator(color: Color(0xFF21b573)),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildStatusCard('${newCount.toString().padLeft(2, '0')} Tasks', 'New', Colors.blue),
                        _buildStatusCard('${progressCount.toString().padLeft(2, '0')} Pending', 'Pending', Colors.amber),
                        _buildStatusCard('${progressCount.toString().padLeft(2, '0')} In Progress', 'Progress', Colors.purple),
                        _buildStatusCard('${completedCount.toString().padLeft(2, '0')} Completed', 'Completed', Colors.green),
                      ],
                    ),
                  ),
                ),
          // Task List View
          Expanded(
            child: _tasksInProgress
                ? const Center(child: CircularProgressIndicator(color: Color(0xFF21b573)))
                : RefreshIndicator(
                    color: const Color(0xFF21b573),
                    onRefresh: _loadData,
                    child: _allTasks.isEmpty
                        ? ListView(
                            children: const [
                              SizedBox(height: 100),
                              Center(
                                child: Text(
                                  'No tasks found!',
                                  style: TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: _allTasks.length,
                            itemBuilder: (context, index) {
                              return TaskCardWidget(
                                taskModel: _allTasks[index],
                                onRefresh: _loadData,
                              );
                            },
                          ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bool? added = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTaskScreen(),
            ),
          );
          if (added == true) {
            _loadData();
          }
        },
        backgroundColor: const Color(0xFF21b573),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatusCard(String countText, String label, Color color) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(right: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              countText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
