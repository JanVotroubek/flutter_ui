import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _passwordController = TextEditingController();

  void _checkPassword() {
    if (_passwordController.text == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SnakeGame(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect password!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter password to unlock the game!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPassword,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  static const int gridSize = 20; // Velikost pole 20x20
  static const double tileSize = 15.0; // Velikost dlaždice
  final List<Offset> _snake = [Offset(4, 4)];
  Offset _food = const Offset(6, 6);
  String _direction = 'right';
  Timer? _timer;
  bool _isRunning = true;
  int _score = 0;
  int _highScore = 0;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (_isRunning) {
        setState(() {
          _moveSnake();
          _checkForCollisions();
        });
      }
    });
  }

  void _moveSnake() {
    Offset newHead;
    switch (_direction) {
      case 'up':
        newHead = Offset(_snake.first.dx, _snake.first.dy - 1);
        break;
      case 'down':
        newHead = Offset(_snake.first.dx, _snake.first.dy + 1);
        break;
      case 'left':
        newHead = Offset(_snake.first.dx - 1, _snake.first.dy);
        break;
      case 'right':
      default:
        newHead = Offset(_snake.first.dx + 1, _snake.first.dy);
    }

    _snake.insert(0, newHead);
    if (newHead == _food) {
      _score++;
      _generateNewFood();
      if (_score > 10) {
        _showAchievement();
      }
    } else {
      _snake.removeLast();
    }
  }

  void _checkForCollisions() {
    if (_snake.first.dx < 0 ||
        _snake.first.dx >= gridSize ||
        _snake.first.dy < 0 ||
        _snake.first.dy >= gridSize ||
        _snake.skip(1).contains(_snake.first)) {
      _isRunning = false;
      _checkHighScore();
      _showGameOverDialog();
    }
  }

  void _checkHighScore() {
    if (_score > _highScore) {
      _highScore = _score;
    }
  }

  void _generateNewFood() {
    setState(() {
      _food = Offset(
        Random().nextInt(gridSize).toDouble(),
        Random().nextInt(gridSize).toDouble(),
      );
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Your score: $_score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Vrátí se zpět na stránku nastavení
              },
              child: const Text('Back to Main Page'),
            ),
          ],
        );
      },
    );
  }

  void _showAchievement() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Achievement unlocked: More than 10 points!')),
    );
  }

  void _onArrowTap(String direction) {
    setState(() {
      if (direction == 'up' && _direction != 'down') {
        _direction = 'up';
      } else if (direction == 'down' && _direction != 'up') {
        _direction = 'down';
      } else if (direction == 'left' && _direction != 'right') {
        _direction = 'left';
      } else if (direction == 'right' && _direction != 'left') {
        _direction = 'right';
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snake Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('Score: $_score', style: const TextStyle(fontSize: 18)),
                Text('High Score: $_highScore', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Container(
                  width: gridSize * tileSize,
                  height: gridSize * tileSize,
                  color: Colors.grey[200],
                  child: GridView.builder(
                    itemCount: gridSize * gridSize,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridSize,
                    ),
                    itemBuilder: (context, index) {
                      final x = index % gridSize;
                      final y = index ~/ gridSize;
                      final offset = Offset(x.toDouble(), y.toDouble());

                      bool isSnake = _snake.contains(offset);
                      bool isFood = offset == _food;

                      return Container(
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: isSnake ? Colors.green : isFood ? Colors.red : Colors.grey[200],
                          borderRadius: isSnake || isFood ? BorderRadius.circular(5) : null,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    iconSize: 40,
                    onPressed: () => _onArrowTap('up'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_left),
                    iconSize: 40,
                    onPressed: () => _onArrowTap('left'),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.arrow_right),
                    iconSize: 40,
                    onPressed: () => _onArrowTap('right'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 40,
                    onPressed: () => _onArrowTap('down'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
