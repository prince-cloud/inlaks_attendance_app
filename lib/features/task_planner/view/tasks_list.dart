
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/provider_state.dart';
import 'package:inlaks_attendance_app/core/utils/text_formating.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_model.dart';
import 'package:inlaks_attendance_app/features/task_planner/provider/task_provider.dart';
import 'package:inlaks_attendance_app/features/task_planner/view/task_detail.dart';
import 'package:inlaks_attendance_app/features/task_planner/widgets/task_container.dart';

import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TaskList extends StatefulWidget {
  static const id = '/task_list';
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool switched = false;
  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => TaskProvider()..fetchTasks(),
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ToggleSwitch(
                minWidth: cs.width,
                cornerRadius: 8.0,
                activeBgColor: [CustomColors.primaryColor],
                activeFgColor: Colors.white,
                inactiveBgColor: CustomColors.genericWhite,
                inactiveFgColor: CustomColors.genericBlack,
                initialLabelIndex: switched ? 1 : 0,
                totalSwitches: 2,
                labels: const ['Task List', 'Completed'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    switched = !switched;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            !switched
                ? Consumer<TaskProvider>(
                    builder: (context, taskProvider, _) {
                      if (taskProvider.state == ProviderState.success &&
                          taskProvider.uncompletedTask.isEmpty) {
                        return const Center(
                          child: Text('No Pending Task Found'),
                        );
                      }

                      if (taskProvider.state == ProviderState.success) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: taskProvider.uncompletedTask.length,
                          itemBuilder: (context, index) {
                            final TaskModel task = taskProvider.uncompletedTask[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  TaskDetail.id,
                                  arguments: task,
                                );
                              },
                              child: TaskContainer(
                                iscompleted: false,
                                cs: cs,
                                status: task.priority.titleCase,
                                description: task.description,
                                date: formatDate(task.dueDate),
                              ),
                            );
                          },
                        );
                      }

                      if (taskProvider.state == ProviderState.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (taskProvider.state == ProviderState.error) {
                        return const Center(
                            child: Text('Something went wrong!'));
                      }
                      return const SizedBox.shrink();
                    },
                  )
                : Consumer<TaskProvider>(
                    builder: (context, taskProvider, _) {
                      if (taskProvider.state == ProviderState.success &&
                          taskProvider.completedTask.isEmpty) {
                        return const Center(
                          child: Text('No Completed Task Found'),
                        );
                      }

                      if (taskProvider.state == ProviderState.success) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: taskProvider.completedTask.length,
                          itemBuilder: (context, index) {
                            final TaskModel task = taskProvider.completedTask[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  TaskDetail.id,
                                  arguments: task,
                                );
                              },
                              child: TaskContainer(
                                iscompleted: true,
                                cs: cs,
                                status: task.priority.titleCase,
                                description: task.description,
                                date: formatDate(task.dueDate),
                              ),
                            );
                          },
                        );
                      }

                      if (taskProvider.state == ProviderState.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (taskProvider.state == ProviderState.error) {
                        return const Center(
                            child: Text('Something went wrong!'));
                      }
                      return const SizedBox.shrink();
                    },
                  )
          ],
        ),
      ),
    );
  }
}
