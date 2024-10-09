import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_master/dialogs/confirm_dialog.dart';
import 'package:task_master/dialogs/context_dialog.dart';
import 'package:task_master/dialogs/input_dialog.dart';
import 'package:task_master/models/database.dart';
import 'package:task_master/models/project.dart';
import 'package:task_master/navigation_handler.dart';
import 'package:task_master/screens/about_page.dart';
import 'package:task_master/screens/project_page.dart';
import 'package:task_master/widgets/extended_floating_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void onNavigateToProject(BuildContext context, int index) {
    NavigationHandler.onTranstionedToNewPage(
      context,
      ChangeNotifierProvider.value(
        value: Provider.of<Database>(context, listen: false).projects[index],
        child: const ProjectPage(),
      ),
    );
  }

  void onContextMenu(BuildContext context, int index) {
    List<ContextMenuItem> items = [
      ContextMenuItem(
        label: "Delete this project",
        onPressCallback: () async {
          Navigator.pop(context);
          bool isConfirmed = await showConfirmationDialog(
            context,
            title: "Delete Project?",
            message:
                "Are you sure you want to delete this project? This action cannot be undone.",
          );

          // ignore: use_build_context_synchronously
          if (isConfirmed) Provider.of<Database>(context, listen: false).removeProjectAt(index);
        },
      ),
      ContextMenuItem(
        label: "Clear Project",
        onPressCallback: () async {
          Navigator.pop(context);
          bool isConfirmed = await showConfirmationDialog(
            context,
            title: "Clear Project?",
            message:
                "Are you sure you want to delete all the cards inside this project? This action cannot be undone.",
          );

          // ignore: use_build_context_synchronously
          if (isConfirmed) Provider.of<Database>(context, listen: false).projects[index].clear();
        },
      ),
      ContextMenuItem(
        label: "Delete all projects",
        onPressCallback: () async {
          Navigator.pop(context);
          bool isConfirmed = await showConfirmationDialog(
            context,
            title: "Delete all projects?",
            message:
                "Are you sure you want to delete all the projects? This action cannot be undone.",
          );

          // ignore: use_build_context_synchronously
          if (isConfirmed) Provider.of<Database>(context, listen: false).clearSystem();
        },
      ),
    ];
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          ContextMenuDialog(title: 'Project Options', items: items),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Database>(
      builder: (context, database, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Task Master",
            style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
              fontSize: 24.0,
              fontVariations: const [FontVariation("wght", 700)],
              letterSpacing: -0.5,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: IconButton(
                onPressed: () => NavigationHandler.onTranstionedToNewPage(context, const AboutPage()),
                icon: const Icon(Icons.info_outline_rounded),
              ),
            ),
          ],
        ),
        floatingActionButton: ExtendedFloatingButton(
          onPressed: () async {
            String? title = await showInputDialog(
              context,
              inputLabel: "Enter Project Title",
              buttonLabel: "Add New Project",
            );

            database.addProject(
              Project(
                title: title!,
                cards: [],
              ),
            );
          },
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: database.projects.length,
          itemBuilder: (context, index) {
            var listTile = ListTile(
              leading: Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                    color: database.projects[index].thumbnailColor,
                    border: Border.all(
                      width: 0.1,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(4.0)),
              ),
              title: Text(database.projects[index].title),
              subtitle: Text("${database.projects[index].cards.length} Cards"),
              onTap: () => onNavigateToProject(context, index),
              onLongPress: () => onContextMenu(context, index),
            );
            return listTile;
          },
        ),
      ),
    );
  }
}
