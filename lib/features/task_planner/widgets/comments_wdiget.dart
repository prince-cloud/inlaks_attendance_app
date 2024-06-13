import 'package:flutter/material.dart';
import 'package:inlaks_attendance_app/core/utils/custom_colors.dart';
import 'package:inlaks_attendance_app/core/utils/provider_state.dart';
import 'package:inlaks_attendance_app/core/utils/text_formating.dart';
import 'package:inlaks_attendance_app/features/task_planner/data/models/task_comment_model.dart';

class CommentSection extends StatefulWidget {
  final List<TaskCommentModel> comments;
  final ProviderState state;
  const CommentSection({super.key, required this.comments, required this.state});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.state == ProviderState.loading)
          const Center(child: CircularProgressIndicator()),
        if(widget.state == ProviderState.error)
        const Text('An Error Occcured'),
        if(widget.state == ProviderState.success && widget.comments.isEmpty)
          const Center(child: Text('No Comments')),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.comments.length,
          itemBuilder: (context, index) {
            final TaskCommentModel comment = widget.comments[index];
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
        ),
      ],
    );
  }
}
