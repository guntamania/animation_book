import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/app_state_provider.dart';
import '../models/app_state.dart';

class RiverpodHooksDemo extends HookConsumerWidget {
  const RiverpodHooksDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateNotifier = ref.read(appStateProvider.notifier);
    
    final textController = useTextEditingController();
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    
    final scaleAnimation = useAnimation(
      Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
      ),
    );

    useEffect(() {
      textController.text = appState.userName;
      return null;
    }, [appState.userName]);

    void handleIncrement() {
      animationController.forward().then((_) {
        animationController.reverse();
      });
      appStateNotifier.increment();
    }

    final isDarkTheme = appState.theme == AppTheme.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod + Hooks デモ'),
        backgroundColor: isDarkTheme ? Colors.grey[900] : Colors.blue,
        foregroundColor: isDarkTheme ? Colors.white : Colors.white,
        actions: [
          IconButton(
            onPressed: appStateNotifier.toggleTheme,
            icon: Icon(
              isDarkTheme ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      backgroundColor: isDarkTheme ? Colors.grey[850] : Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: isDarkTheme ? Colors.grey[800] : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ユーザー情報',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: 'ユーザー名',
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: isDarkTheme ? Colors.white70 : Colors.black54,
                        ),
                      ),
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white : Colors.black87,
                      ),
                      onChanged: appStateNotifier.setUserName,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'こんにちは、${appState.userName}さん！',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkTheme ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '現在のテーマ: ${appState.theme.displayName}',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkTheme ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: isDarkTheme ? Colors.grey[800] : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'カウンター',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) => Transform.scale(
                        scale: scaleAnimation,
                        child: Text(
                          '${appState.counter}',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: isDarkTheme ? Colors.blue[300] : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: appState.isLoading ? null : appStateNotifier.decrement,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkTheme ? Colors.red[700] : Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('減らす'),
                        ),
                        ElevatedButton(
                          onPressed: appState.isLoading ? null : handleIncrement,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkTheme ? Colors.blue[700] : Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('増やす'),
                        ),
                        ElevatedButton(
                          onPressed: appState.isLoading ? null : appStateNotifier.reset,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkTheme ? Colors.grey[600] : Colors.grey,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('リセット'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: appState.isLoading ? null : appStateNotifier.incrementAsync,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkTheme ? Colors.green[700] : Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: appState.isLoading
                            ? const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('処理中...'),
                                ],
                              )
                            : const Text('非同期で増やす (1秒後)'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: isDarkTheme ? Colors.grey[800] : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '状態情報',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkTheme ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'ローディング中: ${appState.isLoading ? "はい" : "いいえ"}',
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'カウンター値: ${appState.counter}',
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ユーザー名: ${appState.userName}',
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'テーマ: ${appState.theme.displayName}',
                      style: TextStyle(
                        color: isDarkTheme ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}