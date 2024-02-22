import 'package:get_it/get_it.dart';
import 'package:qr_code_pro/data/datasources/create_qr_code_datasource.dart';
import 'package:qr_code_pro/data/datasources/qrcode_image_datasource.dart';
import 'package:qr_code_pro/data/datasources/read_qr_code_datasource.dart';
import 'package:qr_code_pro/data/datasources/sqlite/create_qr_code_sqlite_datasources/fetch_create_qr_code_sqlite.dart';
import 'package:qr_code_pro/data/datasources/sqlite/create_qr_code_sqlite_datasources/insert_create_qr_code_sqlite.dart';
import 'package:qr_code_pro/data/datasources/sqlite/insert_image_sqlite_datasources/fetch_qr_code_image_sqlite.dart';
import 'package:qr_code_pro/data/datasources/sqlite/insert_image_sqlite_datasources/insert_qr_code_image_sqlite.dart';
import 'package:qr_code_pro/data/datasources/sqlite/read_qr_code_sqlite_datasources/fetch_read_qr_code_sqlite.dart';
import 'package:qr_code_pro/data/datasources/sqlite/read_qr_code_sqlite_datasources/insert_read_qr_code_sqlite.dart';
import 'package:qr_code_pro/domain/usecases/create_qr_code_image_usecases/fetch_qr_code_image_usecase.dart';
import 'package:qr_code_pro/domain/usecases/create_qr_code_image_usecases/insert_qr_code_image_usecase.dart';
import 'package:qr_code_pro/domain/usecases/qr_code_image_usecases/fetch_qr_code_image_usecase.dart';
import 'package:qr_code_pro/domain/usecases/qr_code_image_usecases/insert_qr_code_image_usecase.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/fetch_read_qr_code_usecase.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/insert_read_qr_code_usecase.dart';

final getIt = GetIt.instance;

void initInjection() {
  initReadQrCodeModule();
  initCreateQrCodeModule();
  initQrCodeImageModule();
}

void initReadQrCodeModule() {
  getIt.registerLazySingleton<InsertReadQrCodeSqlite>(
      () => InsertReadQrCodeSqlite());
  getIt.registerLazySingleton<FetcReadQrCodeSqlite>(
      () => FetcReadQrCodeSqlite());
  getIt.registerLazySingleton<InsertReadQrCodeUsecase>(
      () => InsertReadQrCodeUsecase());
  getIt.registerLazySingleton<FetchReadQrCodeUsecase>(
      () => FetchReadQrCodeUsecase());
  getIt.registerLazySingleton<IFetchAllReadQrCodeDatasource>(
      () => GetIt.instance<FetcReadQrCodeSqlite>());
  getIt.registerLazySingleton<IInsertReadQrCodeDatasource>(
      () => GetIt.instance<InsertReadQrCodeSqlite>());
}

void initCreateQrCodeModule() {
  getIt.registerLazySingleton<FetchCreateQrCodeSqlite>(
      () => FetchCreateQrCodeSqlite());
  getIt.registerLazySingleton<InsertCreateQrCodeSqlite>(
      () => InsertCreateQrCodeSqlite());
  getIt.registerLazySingleton<FetchCreateQrCodeUsecase>(
      () => FetchCreateQrCodeUsecase());
  getIt.registerLazySingleton<InsertCreateQrCodeUsecase>(
      () => InsertCreateQrCodeUsecase());
  getIt.registerLazySingleton<IFetchAllCreateQrCodeDatasource>(
      () => GetIt.instance<FetchCreateQrCodeSqlite>());
  getIt.registerLazySingleton<IInsertCreateQrCodeDatasource>(
      () => GetIt.instance<InsertCreateQrCodeSqlite>());
}

void initQrCodeImageModule() {
  getIt.registerLazySingleton<FetchQrCodeImageSqlite>(
      () => FetchQrCodeImageSqlite());
  getIt.registerLazySingleton<InsertQrCodeImageSqlite>(
      () => InsertQrCodeImageSqlite());
  getIt.registerLazySingleton<FetchQrImageCodeUsecase>(
      () => FetchQrImageCodeUsecase());
  getIt.registerLazySingleton<InsertQrCodeImageUsecase>(
      () => InsertQrCodeImageUsecase());
  getIt.registerLazySingleton<IFetchAllQrCodeImageDatasource>(
      () => GetIt.instance<FetchQrCodeImageSqlite>());
  getIt.registerLazySingleton<IInsertQrCodeImageDatasource>(
      () => GetIt.instance<InsertQrCodeImageSqlite>());
}
