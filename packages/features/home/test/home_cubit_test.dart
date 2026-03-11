import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:logger_manager/logger_manager.dart';

import 'package:home/src/domain/repository/base_home_repository.dart';

import 'package:home/src/presentation/cubit/home_cubit.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([BaseHomeRepository, AppLogger])
void main() {
  late HomeCubit cubit;
  late MockBaseHomeRepository mockRepository;
  late MockAppLogger mockLogger;

  setUp(() {
    mockRepository = MockBaseHomeRepository();
    mockLogger = MockAppLogger();
    cubit = HomeCubit(mockRepository, mockLogger);
  });

  tearDown(() => cubit.close());

  test('initial state is HomeInitialState', () {
    expect(cubit.state, isA<HomeInitialState>());
  });
}
