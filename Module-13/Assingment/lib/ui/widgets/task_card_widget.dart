import 'package:flutter/material.dart';
import '../../data/models/network_response.dart';
import '../../data/models/task_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class TaskCardWidget extends StatefulWidget {
  final TaskModel taskModel;
  final VoidCallback onRefresh;

  const TaskCardWidget({
    super.key,
    required this.taskModel,
    required this.onRefresh,
  });

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  Future<void> _deleteTask() async {
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.deleteTask(widget.taskModel.sId ?? ''),
    );
    if (response.isSuccess) {
      widget.onRefresh();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.errorMessage ?? 'Failed to delete task!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _updateTaskStatus(String status) async {
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.updateTaskStatus(widget.taskModel.sId ?? '', status),
    );
    if (response.isSuccess) {
      widget.onRefresh();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.errorMessage ?? 'Failed to update status!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showStatusUpdateDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['New', 'Progress', 'Completed', 'Cancelled'].map((status) {
              return ListTile(
                title: Text(status),
                trailing: widget.taskModel.status == status
                    ? const Icon(Icons.check, color: Color(0xFF21b573))
                    : null,
                onTap: () {
                  Navigator.pop(context);
                  _updateTaskStatus(status);
                },
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return Colors.blue;
      case 'progress':
      case 'in progress':
        return Colors.purple;
      case 'completed':
        return Colors.green;
      case 'cancelled':
      case 'canceled':
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(widget.taskModel.status ?? 'New');

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.taskModel.title ?? 'No Title',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E3E5C),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.taskModel.description ?? 'No Description',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black85,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Date: ${widget.taskModel.createdDate ?? ''}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.taskModel.status ?? 'New',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: _showStatusUpdateDialog,
                      icon: const Icon(Icons.edit_note, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: _deleteTask,
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
