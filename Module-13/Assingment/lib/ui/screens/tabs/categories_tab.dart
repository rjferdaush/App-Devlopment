import 'package:flutter/material.dart';
import '../../../data/models/network_response.dart';
import '../../../data/models/task_model.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../../widgets/task_card_widget.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<TaskModel> _allTasks = [];
  final List<TaskModel> _newTasks = [];
  final List<TaskModel> _progressTasks = [];
  final List<TaskModel> _completedTasks = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _loadTabTasks(0);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      _loadTabTasks(_tabController.index);
    }
  }

  Future<void> _loadTabTasks(int index) async {
    setState(() {
      _isLoading = true;
    });

    if (index == 0) {
      // Fetch all tasks in parallel
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
      _allTasks.sort((a, b) => (b.createdDate ?? '').compareTo(a.createdDate ?? ''));
    } else if (index == 1) {
      final response = await NetworkCaller.getRequest(Urls.listTaskByStatus('New'));
      _newTasks.clear();
      if (response.isSuccess) {
        final list = TaskListModel.fromJson(response.responseData).data;
        if (list != null) _newTasks.addAll(list);
      }
    } else if (index == 2) {
      final response = await NetworkCaller.getRequest(Urls.listTaskByStatus('Progress'));
      _progressTasks.clear();
      if (response.isSuccess) {
        final list = TaskListModel.fromJson(response.responseData).data;
        if (list != null) _progressTasks.addAll(list);
      }
    } else if (index == 3) {
      final response = await NetworkCaller.getRequest(Urls.listTaskByStatus('Completed'));
      _completedTasks.clear();
      if (response.isSuccess) {
        final list = TaskListModel.fromJson(response.responseData).data;
        if (list != null) _completedTasks.addAll(list);
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF21b573),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFF21b573),
            indicatorWeight: 3,
            tabs: const [
              Tab(text: 'all'),
              Tab(text: 'Pending'),
              Tab(text: 'In Progress'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTaskTabListView(_allTasks, 0),
              _buildTaskTabListView(_newTasks, 1),
              _buildTaskTabListView(_progressTasks, 2),
              _buildTaskTabListView(_completedTasks, 3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskTabListView(List<TaskModel> tasks, int index) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: Color(0xFF21b573)));
    }

    return RefreshIndicator(
      color: const Color(0xFF21b573),
      onRefresh: () => _loadTabTasks(index),
      child: tasks.isEmpty
          ? ListView(
              children: const [
                SizedBox(height: 100),
                Center(
                  child: Text(
                    'No tasks in this category!',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, idx) {
                return TaskCardWidget(
                  taskModel: tasks[idx],
                  onRefresh: () => _loadTabTasks(index),
                );
              },
            ),
    );
  }
}
