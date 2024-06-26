import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todos/home/view/home_page.dart';
import 'package:flutter_todos/l10n/l10n.dart';
import 'package:flutter_todos/theme/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todos_api/todos_api.dart';
// ignore: directives_ordering, implementation_imports
import 'package:todos_api/src/models/concrete_todos_api.dart';
import 'package:todos_repository/todos_repository.dart';
part 'app.g.dart';

@riverpod
TodosApi todosApi(TodosApiRef ref) => ConcreteTodosApi();

@riverpod
TodosRepository todosRepository(TodosRepositoryRef ref) =>
    TodosRepository(todosApi: ref.watch(todosApiProvider));

class App extends ConsumerWidget {
  const App({super.key});

  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        theme: FlutterTodosTheme.light,
        darkTheme: FlutterTodosTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
      );
}
