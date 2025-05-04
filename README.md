# Transaction Activity Flutter Sample
## 🚀 Getting Started

1. **Clone** this repo:

   ```bash
   git clone https://github.com/your-username/transaction_activity.git
   cd transaction_activity
   ```
2. **Install** dependencies:

   ```bash
   flutter pub get
   ```
3. **Run** on device or web:

   ```bash
   flutter run -d chrome   # for web
   flutter run             # for mobile
   ```

## 🔧 State Management

We chose **Riverpod** for its simplicity and compile-safe providers:

* **filterProvider** (`StateProvider<Filter>`) holds the current filter (All, Successful, Pending, Failed).
* **transactionsProvider** (`Provider<List<Transaction>>`) returns the full mock list.
* **filteredTransactionsProvider** (`Provider<List<Transaction>>`) watches both and computes the list to display.

This keeps UI code in `transaction_activity.dart` free of business logic and easy to test.

## 🎨 Responsive & Animation

* **Responsive layout**: `LayoutBuilder` checks `constraints.maxWidth > 600`.

  * On wide screens: filters in a left-side panel and list on right.
  * On narrow screens: filters above the list in a column.
* **Animation**: `AnimatedSwitcher` wraps the list/fallback widget. It fades between states in 300 ms when the filter changes.

## 🔄 Filter Interaction

1. Tap a filter `ChoiceChip`.
2. Riverpod updates `filterProvider`.
3. `filteredTransactionsProvider` recomputes.
4. `AnimatedSwitcher` fades out the old list and fades in the new one (or fallback UI).

## 📸 Demo

<kbd>![Filter Demo](demo/transaction_filter.gif)</kbd>

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
   cupertino_icons: ^1.0.8
   flutter_riverpod: ^2.6.1
   
dev_dependencies:
  flutter_test:
    sdk: flutter
```

## 📝 Notes

* To adapt for real data, replace the mock list in `transactionsProvider` with your API call.
* The responsive breakpoint (600) can be tweaked to match your design.
* You can swap Riverpod for BLoC by moving filter state into a Cubit and using `BlocBuilder`.

---

Built with ❤️ for your interview. Good luck!
