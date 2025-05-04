import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/States.dart';
import '../providers/provider.dart';

class TransactionActivity extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(filteredTransactionsProvider);
    final filter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Transactions')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          final filters = Wrap(
            direction: isWide ? Axis.vertical : Axis.horizontal,
            spacing: 8,
            children: Filter.values.map((f) {
              final label = f.toString().split('.').last;
              final selected = f == filter;
              return ChoiceChip(
                label: Text(label),
                selected: selected,
                onSelected: (_) =>
                    ref.read(filterProvider.notifier).state = f,
              );
            }).toList(),
          );

          final list = Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: items.isEmpty
                  ? Center(
                      key: ValueKey('empty'),
                      child: Text('No transactions', style: TextStyle(fontSize: 18)),
                    )
                  : ListView.builder(
                      key: ValueKey(filter),
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        final t = items[i];
                        return ListTile(
                          leading: Icon(
                            t.status == Filter.successful
                                ? Icons.check_circle
                                : t.status == Filter.pending
                                    ? Icons.hourglass_empty
                                    : Icons.error,
                          ),
                          title: Text('\$${t.amount.toStringAsFixed(2)}'),
                          subtitle: Text(
                              '${t.date.month}/${t.date.day}/${t.date.year}'),
                          trailing: Text(t.status.toString().split('.').last),
                        );
                      },
                    ),
            ),
          );

          if (isWide) {
            return Row(
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.all(16),
                  child: filters,
                ),
                VerticalDivider(width: 1),
                list,
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: filters,
                ),
                list,
              ],
            );
          }
        },
      ),
    );
  }
}