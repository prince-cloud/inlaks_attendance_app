import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/data_list.dart';

class TaskContainer extends StatelessWidget {
  final String status;
  final String description;
  final String date;
  final bool iscompleted;
  const TaskContainer({
    super.key,
    required this.cs,
    required this.status,
    required this.description,
    required this.date,
    required this.iscompleted,
  });

  final Size cs;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(date),
              iscompleted
                  ? const Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      color: Colors.green,
                    )
                  : const Icon(
                      CupertinoIcons.check_mark_circled,
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
                  color: getPriorityColor(status).withAlpha(40),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: getPriorityColor(status),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
