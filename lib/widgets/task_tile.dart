import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onCheckboxChanged;
  final VoidCallback onDeletePressed;

  const TaskTile({
    super.key,
    required this.task,
    required this.onCheckboxChanged,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (_) => onCheckboxChanged(),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            color: task.isDone ? Colors.grey : Colors.black87,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: onDeletePressed,
        ),
      ),
    );
  }
}