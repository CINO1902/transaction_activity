// Riverpod providers
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/TransactionModel.dart';
import '../../domain/usecases/States.dart';

final filterProvider = StateProvider<Filter>((ref) => Filter.all);
final filteredTransactionsProvider = Provider<List<Transaction>>((ref) {
  final filter = ref.watch(filterProvider);
  if (filter == Filter.all) return transactions;
  return transactions.where((t) {
    switch (filter) {
      case Filter.successful:
        return t.status == Filter.successful;
      case Filter.pending:
        return t.status == Filter.pending;
      case Filter.failed:
        return t.status == Filter.failed;
      default:
        return true;
    }
  }).toList();
});
