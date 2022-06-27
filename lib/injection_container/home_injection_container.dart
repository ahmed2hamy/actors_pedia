import 'package:actors_pedia/core/helpers/local_cache_helper.dart';
import 'package:actors_pedia/core/helpers/network/network_client.dart';
import 'package:actors_pedia/core/helpers/network/network_info.dart';
import 'package:actors_pedia/features/home/data/data_sources/home_local_data_source.dart';
import 'package:actors_pedia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:actors_pedia/features/home/data/repositories/home_repository_impl.dart';
import 'package:actors_pedia/features/home/domain/repositories/home_repository.dart';
import 'package:actors_pedia/features/home/domain/use_cases/get_people_use_case.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_cubit.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_scroll_to_top_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> injectHomeFeature(GetIt sl) async {
  ///Provider:
  sl.registerFactory<HomeScrollToTopProvider>(() => HomeScrollToTopProvider());

  ///Bloc:
  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      getPeopleUseCase: sl<GetPeopleUseCase>(),
    ),
  );

  ///UseCases:
  sl.registerFactory<GetPeopleUseCase>(
    () => GetPeopleUseCase(
      homeRepository: sl<HomeRepository>(),
    ),
  );

  ///Repository:
  sl.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<HomeRemoteDataSource>(),
      localDataSource: sl<HomeLocalDataSource>(),
    ),
  );

  ///DataSources:
  sl.registerFactory<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      networkClient: sl<NetworkClient>(),
    ),
  );

  sl.registerFactory<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(
      localCacheHelper: sl<LocalCacheHelper>(),
    ),
  );
}
