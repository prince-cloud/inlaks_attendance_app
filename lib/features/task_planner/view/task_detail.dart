import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';

class TaskDetail extends StatefulWidget {
  static const id = '/task_detail';

  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    final cs = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColors.genericBlack.withAlpha(80),
              ),
              child: const Icon(
                CupertinoIcons.back,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                CupertinoIcons.app_badge,
                color: CustomColors.genericBlack,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          title: Text(
            'Task Detail',
            style: TextStyle(
              color: CustomColors.primaryTextLight,
              fontSize: 15,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
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
            const Text(
              'Meet with Customer at Prudential Bank for Inlaks Solutions opportunity, Meet with Customer at Prudential Bank for Inlaks Solutions opportunity ...',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    SizedBox(
                      height: 5,
                    ),
                    Text("Thur., 21st May 2024"),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
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
                        color: Colors.red.withAlpha(40),
                      ),
                      child: const Text(
                        'High',
                        style: TextStyle(
                          color: Colors.red,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Customer wasn\'t avaiable for the meeting, asked for it to be rescheduled.',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'May 23, 2024 - 10:00 AM',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.genericBlack.withAlpha(80),
                  ),
                ),
              ],
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
                    hintText: 'Ad comment',
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
    );
  }
}
