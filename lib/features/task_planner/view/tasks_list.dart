import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/data_list.dart';
import 'package:inlaks_attendance_app/core/utils/provider_state.dart';
import 'package:inlaks_attendance_app/core/utils/text_formating.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/task_model.dart';
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
                          taskProvider.tasks.isEmpty) {
                        return const Center(
                          child: Text('No Task Found'),
                        );
                      }

                      if (taskProvider.state == ProviderState.success) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: taskProvider.tasks.length,
                          itemBuilder: (context, index) {
                            final TaskModel task = taskProvider.tasks[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  TaskDetail.id,
                                  arguments: task,
                                );
                              },
                              child: TaskContainer(
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
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(10),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        width: cs.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Meet with Customer at Prudential Bank for Inlaks Solutions opportunity ...',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Thursday, 21st May 2024"),
                                Icon(
                                  CupertinoIcons.check_mark_circled_solid,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Priority',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        getPriorityColor('Low').withAlpha(40),
                                  ),
                                  child: Text(
                                    'Low',
                                    style: TextStyle(
                                      color: getPriorityColor('Low'),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(10),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        width: cs.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Meet with Customer at Prudential Bank for Inlaks Solutions opportunity ...',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Thursday, 21st May 2024"),
                                Icon(
                                  CupertinoIcons.check_mark_circled_solid,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Priority',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        getPriorityColor('High').withAlpha(40),
                                  ),
                                  child: Text(
                                    'High',
                                    style: TextStyle(
                                      color: getPriorityColor('High'),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
