import 'package:flutter/material.dart';
import 'package:task_master/models/project.dart';
import 'package:task_master/models/card.dart';
import 'package:task_master/models/task.dart';

class Database extends ChangeNotifier {
  List<Project> get projects => _projects;

  void addProject(Project project) {
    _projects.insert(0, project);
    notifyListeners();
  }

  void removeProjectAt(int index) {
    _projects.removeAt(index);
    notifyListeners();
  }

  void clearSystem() {
    _projects.clear();
    notifyListeners();
  }

  final List<Project> _projects = [
    Project(
      title: 'Grocery List',
      cards: [
        CardData(
          title: 'Fruits',
          tasks: [
            TaskData(label: 'Buy apples'),
            TaskData(label: 'Buy bananas'),
            TaskData(label: 'Buy oranges'),
          ],
        ),
        CardData(
          title: 'Vegetables',
          tasks: [
            TaskData(label: 'Buy spinach'),
            TaskData(label: 'Buy tomatoes'),
            TaskData(label: 'Buy broccoli'),
          ],
        ),
        CardData(
          title: 'Dairy',
          tasks: [
            TaskData(label: 'Get milk'),
            TaskData(label: 'Get cheese'),
            TaskData(label: 'Get yogurt'),
          ],
        ),
        CardData(
          title: 'Snacks',
          tasks: [
            TaskData(label: 'Get chips'),
            TaskData(label: 'Buy crackers'),
            TaskData(label: 'Get cookies'),
          ],
        ),
      ],
      thumbnailColor: Colors.green,
    ),
    Project(
      title: 'Workout Routine',
      cards: [
        CardData(
          title: 'Cardio',
          tasks: [
            TaskData(label: '30 mins running'),
            TaskData(label: '15 mins cycling'),
            TaskData(label: '10 mins jump rope'),
          ],
        ),
        CardData(
          title: 'Strength Training',
          tasks: [
            TaskData(label: 'Squats 3x10'),
            TaskData(label: 'Push-ups 3x15'),
            TaskData(label: 'Deadlifts 3x8'),
          ],
        ),
        CardData(
          title: 'Flexibility',
          tasks: [
            TaskData(label: '20 mins yoga'),
            TaskData(label: 'Stretching routine'),
            TaskData(label: 'Meditation'),
          ],
        ),
      ],
      thumbnailColor: Colors.blue,
    ),
    Project(
      title: 'Book Club',
      cards: [
        CardData(
          title: 'Science Fiction',
          tasks: [
            TaskData(label: 'Read "Dune"'),
            TaskData(label: 'Discuss chapters 1-5'),
            TaskData(label: 'Research author bio'),
          ],
        ),
        CardData(
          title: 'Mystery',
          tasks: [
            TaskData(label: 'Finish "The Hound of the Baskervilles"'),
            TaskData(label: 'Write a review'),
            TaskData(label: 'Prepare for discussion'),
          ],
        ),
        CardData(
          title: 'Non-Fiction',
          tasks: [
            TaskData(label: 'Read "Sapiens"'),
            TaskData(label: 'Summarize chapter 2'),
            TaskData(label: 'Discuss main points'),
          ],
        ),
      ],
      thumbnailColor: Colors.orange,
    ),
    Project(
      title: 'Travel Plans',
      cards: [
        CardData(
          title: 'Europe Trip',
          tasks: [
            TaskData(label: 'Book flight tickets'),
            TaskData(label: 'Reserve hotel in Paris'),
            TaskData(label: 'Plan sightseeing'),
          ],
        ),
        CardData(
          title: 'Asia Trip',
          tasks: [
            TaskData(label: 'Get visa for Japan'),
            TaskData(label: 'Plan itinerary for Tokyo'),
            TaskData(label: 'Check accommodation options'),
          ],
        ),
        CardData(
          title: 'US Road Trip',
          tasks: [
            TaskData(label: 'Rent a car'),
            TaskData(label: 'Plan route'),
            TaskData(label: 'Book accommodations'),
          ],
        ),
      ],
      thumbnailColor: Colors.teal,
    ),
    Project(
      title: 'Cooking Recipes',
      cards: [
        CardData(
          title: 'Desserts',
          tasks: [
            TaskData(label: 'Bake chocolate cake'),
            TaskData(label: 'Make fruit salad'),
            TaskData(label: 'Prepare cookies'),
          ],
        ),
        CardData(
          title: 'Main Courses',
          tasks: [
            TaskData(label: 'Cook spaghetti'),
            TaskData(label: 'Make chicken curry'),
            TaskData(label: 'Prepare grilled salmon'),
          ],
        ),
        CardData(
          title: 'Appetizers',
          tasks: [
            TaskData(label: 'Prepare bruschetta'),
            TaskData(label: 'Make stuffed mushrooms'),
            TaskData(label: 'Create cheese platter'),
          ],
        ),
      ],
      thumbnailColor: Colors.brown,
    ),
    Project(
      title: 'Music Playlist',
      cards: [
        CardData(
          title: 'Chill Vibes',
          tasks: [
            TaskData(label: 'Add 5 new songs'),
            TaskData(label: 'Create mood-based playlist'),
            TaskData(label: 'Share with friends'),
          ],
        ),
        CardData(
          title: 'Party Hits',
          tasks: [
            TaskData(label: 'Curate top 10 tracks'),
            TaskData(label: 'Sync with phone'),
            TaskData(label: 'Prepare for next party'),
          ],
        ),
        CardData(
          title: 'Classical Favorites',
          tasks: [
            TaskData(label: 'Add Beethoven’s 5th Symphony'),
            TaskData(label: 'Listen to Mozart’s Requiem'),
            TaskData(label: 'Create a “Best of Bach” playlist'),
          ],
        ),
      ],
      thumbnailColor: Colors.pink,
    ),
    Project(
      title: 'Game Development',
      cards: [
        CardData(
          title: 'Level Design',
          tasks: [
            TaskData(label: 'Sketch level layout'),
            TaskData(label: 'Implement first level'),
            TaskData(label: 'Test difficulty'),
          ],
        ),
        CardData(
          title: 'Character Design',
          tasks: [
            TaskData(label: 'Create main character model'),
            TaskData(label: 'Design enemy sprites'),
            TaskData(label: 'Adjust animation timings'),
          ],
        ),
        CardData(
          title: 'UI Design',
          tasks: [
            TaskData(label: 'Design menu screens'),
            TaskData(label: 'Implement HUD'),
            TaskData(label: 'Test user experience'),
          ],
        ),
        CardData(
          title: 'Sound Effects',
          tasks: [
            TaskData(label: 'Record ambient sounds'),
            TaskData(label: 'Add sound effects to enemies'),
            TaskData(label: 'Adjust volume levels'),
          ],
        ),
      ],
      thumbnailColor: Colors.indigo,
    ),
    Project(
      title: 'Study Schedule',
      cards: [
        CardData(
          title: 'Math',
          tasks: [
            TaskData(label: 'Finish algebra exercises'),
            TaskData(label: 'Review calculus notes'),
            TaskData(label: 'Practice geometry problems'),
          ],
        ),
        CardData(
          title: 'Science',
          tasks: [
            TaskData(label: 'Read biology chapter 3'),
            TaskData(label: 'Conduct physics experiment'),
            TaskData(label: 'Review chemistry formulas'),
          ],
        ),
        CardData(
          title: 'History',
          tasks: [
            TaskData(label: 'Read WWII chapter'),
            TaskData(label: 'Prepare presentation on Cold War'),
            TaskData(label: 'Review civil rights movement'),
          ],
        ),
      ],
      thumbnailColor: Colors.yellow,
    ),
    Project(
      title: 'Event Planning',
      cards: [
        CardData(
          title: 'Birthday Party',
          tasks: [
            TaskData(label: 'Send invitations'),
            TaskData(label: 'Order cake'),
            TaskData(label: 'Plan games and activities'),
          ],
        ),
        CardData(
          title: 'Wedding',
          tasks: [
            TaskData(label: 'Book venue'),
            TaskData(label: 'Arrange catering'),
            TaskData(label: 'Hire photographer'),
          ],
        ),
        CardData(
          title: 'Conference',
          tasks: [
            TaskData(label: 'Arrange guest speakers'),
            TaskData(label: 'Organize travel for attendees'),
            TaskData(label: 'Book conference room'),
          ],
        ),
      ],
      thumbnailColor: Colors.purple,
    ),
    Project(
      title: 'Home Renovation',
      cards: [
        CardData(
          title: 'Living Room',
          tasks: [
            TaskData(label: 'Choose paint color'),
            TaskData(label: 'Buy new furniture'),
            TaskData(label: 'Install shelves'),
          ],
        ),
        CardData(
          title: 'Kitchen',
          tasks: [
            TaskData(label: 'Replace countertop'),
            TaskData(label: 'Install new backsplash'),
            TaskData(label: 'Organize pantry'),
          ],
        ),
        CardData(
          title: 'Bathroom',
          tasks: [
            TaskData(label: 'Buy new shower curtain'),
            TaskData(label: 'Fix sink faucet'),
            TaskData(label: 'Add storage solutions'),
          ],
        ),
      ],
      thumbnailColor: Colors.grey,
    ),
  ];
}
