import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hangisini_secerdin/oyun_hangisini_secerdin.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hangisiniSecerdinConfig.title.length, 33);
    expect(hangisiniSecerdinConfig.tagline.length, 33);
    for (final s in hangisiniSecerdinConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hangisiniSecerdinConfig.gameId, hangisiniSecerdinId);
    expect(hangisiniSecerdinRules.gameId, hangisiniSecerdinId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hangisiniSecerdinRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hangisiniSecerdinId, optionalMechanics: hangisiniSecerdinRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hangisiniSecerdinRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
