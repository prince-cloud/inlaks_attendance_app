import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/data_list.dart';
import 'package:inlaks_attendance_app/core/utils/provider_state.dart';

import 'package:inlaks_attendance_app/core/utils/text_formating.dart';
import 'package:inlaks_attendance_app/core/widgets/custom_appbar.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_comment_model.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_model.dart';
import 'package:inlaks_attendance_app/features/task_planner/provider/task_provider.dart';
import 'package:provider/provider.dart';

class TaskDetail extends StatefulWidget {
  final TaskModel task;
  static const id = '/task_detail';

  const TaskDetail({super.key, required this.task});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  bool completed = false;

  List<TaskCommentModel> specificTaskComments = [];
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) =>
          TaskCommentProvider()..fetchComments(taskId: widget.task.id),
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: customAppBar(context: context),
          body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            children: [
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.task.description,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            CupertinoIcons.time,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Due Date',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(formatDate(widget.task.dueDate)),
                      const SizedBox(
                        height: 30,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notify Me',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("10 Min"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Priority',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: getPriorityColor(widget.task.priority)
                              .withAlpha(40),
                        ),
                        child: Text(
                          widget.task.priority.titleCase,
                          style: TextStyle(
                            color: getPriorityColor(widget.task.priority),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            completed = !completed;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Status',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                completed
                                    ? const Icon(
                                        CupertinoIcons.check_mark_circled_solid,
                                        color: Colors.green,
                                        size: 18,
                                      )
                                    : const Icon(
                                        CupertinoIcons.check_mark_circled,
                                        size: 18,
                                      ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  completed ? "Completed" : "Not Completed",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Comments',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(),
              Consumer<TaskCommentProvider>(
                builder: (context, commentProvider, _) {
                  if (commentProvider.state == ProviderState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (commentProvider.state == ProviderState.error) {
                    return const Center(child: Text('Failed to load comments'));
                  } else if (commentProvider.state == ProviderState.success &&
                      commentProvider.taskComments.isEmpty) {
                    return const Center(child: Text('No comments available'));
                  } else if (commentProvider.state == ProviderState.success) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: commentProvider.taskComments.length,
                      itemBuilder: (context, index) {
                        final TaskCommentModel comment =
                            commentProvider.taskComments[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(comment.comment),
                            const SizedBox(height: 10),
                            Text(
                              formatDate(comment.dateCreated),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: CustomColors.genericBlack.withAlpha(80),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: cs.width * 0.8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Add comment',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(CupertinoIcons.paperplane),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
