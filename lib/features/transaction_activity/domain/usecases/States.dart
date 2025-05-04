// Mock data
import '../entities/TransactionModel.dart';

final transactions = <Transaction>[
  Transaction(
      id: '1',
      amount: 50.0,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: Filter.successful),
  Transaction(
      id: '2',
      amount: 20.0,
      date: DateTime.now().subtract(Duration(days: 2)),
      status: Filter.failed),
  Transaction(
      id: '3',
      amount: 75.5,
      date: DateTime.now().subtract(Duration(days: 3)),
      status: Filter.pending),
  Transaction(
      id: '4',
      amount: 100.0,
      date: DateTime.now().subtract(Duration(days: 4)),
      status: Filter.successful),
  Transaction(
      id: '5',
      amount: 10.0,
      date: DateTime.now().subtract(Duration(days: 5)),
      status: Filter.failed),
];

// Filter options
enum Filter { all, successful, pending, failed }
