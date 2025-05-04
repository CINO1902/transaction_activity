// Transaction model
import '../usecases/States.dart';

class Transaction {
  final String id;
  final double amount;
  final DateTime date;
  final Filter status; // "Successful", "Pending", "Failed"
  Transaction(
      {required this.id,
      required this.amount,
      required this.date,
      required this.status});
}