
import 'package:flutter/material.dart';

Color getPriorityColor(String priority) {
  switch (priority.toUpperCase()) {
    case 'HIGH':
      return Colors.red;
    case 'MEDIUM':
      return Colors.orange;
    default:
      return Colors.green;
  
  }
}