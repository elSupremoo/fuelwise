import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cardetails.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future<void> deleteDatabaseFile() async {
    String path = join(await getDatabasesPath(), 'cardetails.db');
    await deleteDatabase(path);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE CarDetails (
        id INTEGER PRIMARY KEY,
        make TEXT,
        model TEXT,
        year INTEGER,
        mpg REAL,
        weight INTEGER,
        fullTank INTEGER
      )
    ''');

    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Camry',
      'year': 2020,
      'mpg': 32.0,
      'weight': 3241,
      'fullTank': 428
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Civic',
      'year': 2021,
      'mpg': 36.0,
      'weight': 2923,
      'fullTank': 462
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Focus',
      'year': 2019,
      'mpg': 30.0,
      'weight': 2998,
      'fullTank': 387
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Altima',
      'year': 2022,
      'mpg': 34.0,
      'weight': 3274,
      'fullTank': 380
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Prius',
      'year': 2013,
      'mpg': 53,
      'weight': 3042,
      'fullTank': 489
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Camry',
      'year': 2023,
      'mpg': 32,
      'weight': 3340,
      'fullTank': 505
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Accord',
      'year': 2023,
      'mpg': 33,
      'weight': 3121,
      'fullTank': 488
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'F-150',
      'year': 2023,
      'mpg': 20,
      'weight': 4500,
      'fullTank': 520
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Silverado 1500',
      'year': 2023,
      'mpg': 21,
      'weight': 4482,
      'fullTank': 504
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Altima',
      'year': 2023,
      'mpg': 31,
      'weight': 3208,
      'fullTank': 502
    });

    await db.insert('CarDetails', {
      'make': 'Hyundai',
      'model': 'Elantra',
      'year': 2022,
      'mpg': 37,
      'weight': 2844,
      'fullTank': 518
    });
    await db.insert('CarDetails', {
      'make': 'Kia',
      'model': 'Soul',
      'year': 2022,
      'mpg': 30,
      'weight': 2931,
      'fullTank': 480
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Outback',
      'year': 2021,
      'mpg': 29,
      'weight': 3640,
      'fullTank': 536
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Grand Cherokee',
      'year': 2021,
      'mpg': 22,
      'weight': 4495,
      'fullTank': 450
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'F-Series',
      'year': 2024,
      'mpg': 25,
      'weight': 4021,
      'fullTank': 676
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Silverado',
      'year': 2024,
      'mpg': 23,
      'weight': 4257,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Ram',
      'model': 'Pickup',
      'year': 2024,
      'mpg': 22,
      'weight': 4798,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'RAV4',
      'year': 2024,
      'mpg': 30,
      'weight': 3370,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'CR-V',
      'year': 2024,
      'mpg': 30,
      'weight': 3337,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Camry',
      'year': 2024,
      'mpg': 32,
      'weight': 3310,
      'fullTank': 476
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Civic',
      'year': 2024,
      'mpg': 33,
      'weight': 2877,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Corolla',
      'year': 2024,
      'mpg': 33,
      'weight': 2910,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Rogue',
      'year': 2024,
      'mpg': 30,
      'weight': 3371,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Accord',
      'year': 2024,
      'mpg': 32,
      'weight': 3150,
      'fullTank': 448
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Explorer',
      'year': 2024,
      'mpg': 24,
      'weight': 4345,
      'fullTank': 456
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Grand Cherokee',
      'year': 2024,
      'mpg': 22,
      'weight': 4238,
      'fullTank': 484
    });
    await db.insert('CarDetails', {
      'make': 'GMC',
      'model': 'Sierra',
      'year': 2024,
      'mpg': 23,
      'weight': 4369,
      'fullTank': 552
    });
    await db.insert('CarDetails', {
      'make': 'Hyundai',
      'model': 'Tucson',
      'year': 2024,
      'mpg': 29,
      'weight': 3329,
      'fullTank': 435
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Wrangler',
      'year': 2024,
      'mpg': 20,
      'weight': 3948,
      'fullTank': 420
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Forester',
      'year': 2024,
      'mpg': 29,
      'weight': 3449,
      'fullTank': 464
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Outback',
      'year': 2024,
      'mpg': 29,
      'weight': 3637,
      'fullTank': 522
    });
    await db.insert('CarDetails', {
      'make': 'Kia',
      'model': 'Sportage',
      'year': 2024,
      'mpg': 28,
      'weight': 3364,
      'fullTank': 448
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Tacoma',
      'year': 2024,
      'mpg': 21,
      'weight': 4445,
      'fullTank': 441
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Highlander',
      'year': 2024,
      'mpg': 24,
      'weight': 4145,
      'fullTank': 437
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'F-Series',
      'year': 2023,
      'mpg': 25,
      'weight': 4021,
      'fullTank': 676
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Silverado',
      'year': 2023,
      'mpg': 23,
      'weight': 4257,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'RAM',
      'model': 'Pickup',
      'year': 2023,
      'mpg': 22,
      'weight': 4798,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'RAV4',
      'year': 2023,
      'mpg': 30,
      'weight': 3370,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'CR-V',
      'year': 2023,
      'mpg': 30,
      'weight': 3337,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'GMC',
      'model': 'Sierra',
      'year': 2023,
      'mpg': 23,
      'weight': 4369,
      'fullTank': 552
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Camry',
      'year': 2023,
      'mpg': 32,
      'weight': 3310,
      'fullTank': 476
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Rogue',
      'year': 2023,
      'mpg': 30,
      'weight': 3371,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Grand Cherokee',
      'year': 2023,
      'mpg': 22,
      'weight': 4238,
      'fullTank': 484
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Tacoma',
      'year': 2023,
      'mpg': 21,
      'weight': 4445,
      'fullTank': 441
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Corolla',
      'year': 2023,
      'mpg': 33,
      'weight': 2910,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Equinox',
      'year': 2023,
      'mpg': 28,
      'weight': 3274,
      'fullTank': 392
    });
    await db.insert('CarDetails', {
      'make': 'Hyundai',
      'model': 'Tucson',
      'year': 2023,
      'mpg': 29,
      'weight': 3329,
      'fullTank': 435
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Civic',
      'year': 2023,
      'mpg': 33,
      'weight': 2877,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Accord',
      'year': 2023,
      'mpg': 32,
      'weight': 3150,
      'fullTank': 448
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Explorer',
      'year': 2023,
      'mpg': 24,
      'weight': 4345,
      'fullTank': 456
    });
    await db.insert('CarDetails', {
      'make': 'Mazda',
      'model': 'CX-5',
      'year': 2023,
      'mpg': 26,
      'weight': 3552,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Wrangler',
      'year': 2023,
      'mpg': 20,
      'weight': 3948,
      'fullTank': 420
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Forester',
      'year': 2023,
      'mpg': 29,
      'weight': 3449,
      'fullTank': 464
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Crosstrek',
      'year': 2023,
      'mpg': 30,
      'weight': 3117,
      'fullTank': 436
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'F-Series',
      'year': 2022,
      'mpg': 25,
      'weight': 4021,
      'fullTank': 676
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Silverado',
      'year': 2022,
      'mpg': 23,
      'weight': 4257,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'RAM',
      'model': 'Pickup',
      'year': 2022,
      'mpg': 22,
      'weight': 4798,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'RAV4',
      'year': 2022,
      'mpg': 30,
      'weight': 3370,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Camry',
      'year': 2022,
      'mpg': 32,
      'weight': 3310,
      'fullTank': 476
    });
    await db.insert('CarDetails', {
      'make': 'GMC',
      'model': 'Sierra',
      'year': 2022,
      'mpg': 23,
      'weight': 4369,
      'fullTank': 552
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'CR-V',
      'year': 2022,
      'mpg': 30,
      'weight': 3337,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Tacoma',
      'year': 2022,
      'mpg': 21,
      'weight': 4445,
      'fullTank': 441
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Grand Cherokee',
      'year': 2022,
      'mpg': 22,
      'weight': 4238,
      'fullTank': 484
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Highlander',
      'year': 2022,
      'mpg': 24,
      'weight': 4145,
      'fullTank': 437
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Corolla',
      'year': 2022,
      'mpg': 33,
      'weight': 2910,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Equinox',
      'year': 2022,
      'mpg': 28,
      'weight': 3274,
      'fullTank': 392
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Explorer',
      'year': 2022,
      'mpg': 24,
      'weight': 4345,
      'fullTank': 456
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Rogue',
      'year': 2022,
      'mpg': 30,
      'weight': 3371,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Wrangler',
      'year': 2022,
      'mpg': 20,
      'weight': 3948,
      'fullTank': 420
    });
    await db.insert('CarDetails', {
      'make': 'Hyundai',
      'model': 'Tucson',
      'year': 2022,
      'mpg': 29,
      'weight': 3329,
      'fullTank': 435
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Crosstrek',
      'year': 2022,
      'mpg': 30,
      'weight': 3117,
      'fullTank': 436
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Accord',
      'year': 2022,
      'mpg': 32,
      'weight': 3150,
      'fullTank': 448
    });
    await db.insert('CarDetails', {
      'make': 'Mazda',
      'model': 'CX-5',
      'year': 2022,
      'mpg': 26,
      'weight': 3552,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Outback',
      'year': 2022,
      'mpg': 29,
      'weight': 3637,
      'fullTank': 522
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'F-Series',
      'year': 2021,
      'mpg': 25,
      'weight': 4021,
      'fullTank': 676
    });
    await db.insert('CarDetails', {
      'make': 'RAM',
      'model': 'Pickup',
      'year': 2021,
      'mpg': 22,
      'weight': 4798,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Silverado',
      'year': 2021,
      'mpg': 23,
      'weight': 4257,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'RAV4',
      'year': 2021,
      'mpg': 30,
      'weight': 3370,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'CR-V',
      'year': 2021,
      'mpg': 30,
      'weight': 3337,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Camry',
      'year': 2021,
      'mpg': 32,
      'weight': 3310,
      'fullTank': 476
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Civic',
      'year': 2021,
      'mpg': 33,
      'weight': 2877,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Corolla',
      'year': 2021,
      'mpg': 33,
      'weight': 2910,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Tacoma',
      'year': 2021,
      'mpg': 21,
      'weight': 4445,
      'fullTank': 441
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Highlander',
      'year': 2021,
      'mpg': 24,
      'weight': 4145,
      'fullTank': 437
    });
    await db.insert('CarDetails', {
      'make': 'GMC',
      'model': 'Sierra',
      'year': 2021,
      'mpg': 23,
      'weight': 4369,
      'fullTank': 552
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Rogue',
      'year': 2021,
      'mpg': 30,
      'weight': 3371,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Grand Cherokee',
      'year': 2021,
      'mpg': 22,
      'weight': 4238,
      'fullTank': 484
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Explorer',
      'year': 2021,
      'mpg': 24,
      'weight': 4345,
      'fullTank': 456
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Wrangler',
      'year': 2021,
      'mpg': 20,
      'weight': 3948,
      'fullTank': 420
    });
    await db.insert('CarDetails', {
      'make': 'Hyundai',
      'model': 'Tucson',
      'year': 2021,
      'mpg': 29,
      'weight': 3329,
      'fullTank': 435
    });
    await db.insert('CarDetails', {
      'make': 'Mazda',
      'model': 'CX-5',
      'year': 2021,
      'mpg': 26,
      'weight': 3552,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Accord',
      'year': 2021,
      'mpg': 32,
      'weight': 3150,
      'fullTank': 448
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Equinox',
      'year': 2021,
      'mpg': 28,
      'weight': 3274,
      'fullTank': 392
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Forester',
      'year': 2021,
      'mpg': 29,
      'weight': 3449,
      'fullTank': 464
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'F-Series',
      'year': 2020,
      'mpg': 25,
      'weight': 4021,
      'fullTank': 676
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Silverado',
      'year': 2020,
      'mpg': 23,
      'weight': 4257,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'RAM',
      'model': 'Pickup',
      'year': 2020,
      'mpg': 22,
      'weight': 4798,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'RAV4',
      'year': 2020,
      'mpg': 30,
      'weight': 3370,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'CR-V',
      'year': 2020,
      'mpg': 30,
      'weight': 3337,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Camry',
      'year': 2020,
      'mpg': 32,
      'weight': 3310,
      'fullTank': 476
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Equinox',
      'year': 2020,
      'mpg': 28,
      'weight': 3274,
      'fullTank': 392
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Civic',
      'year': 2020,
      'mpg': 33,
      'weight': 2877,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'GMC',
      'model': 'Sierra',
      'year': 2020,
      'mpg': 23,
      'weight': 4369,
      'fullTank': 552
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Corolla',
      'year': 2020,
      'mpg': 33,
      'weight': 2910,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Tacoma',
      'year': 2020,
      'mpg': 21,
      'weight': 4445,
      'fullTank': 441
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Highlander',
      'year': 2020,
      'mpg': 24,
      'weight': 4145,
      'fullTank': 437
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Grand Cherokee',
      'year': 2020,
      'mpg': 22,
      'weight': 4238,
      'fullTank': 484
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Explorer',
      'year': 2020,
      'mpg': 24,
      'weight': 4345,
      'fullTank': 456
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Wrangler',
      'year': 2020,
      'mpg': 20,
      'weight': 3948,
      'fullTank': 420
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Accord',
      'year': 2020,
      'mpg': 32,
      'weight': 3150,
      'fullTank': 448
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Rogue',
      'year': 2020,
      'mpg': 30,
      'weight': 3371,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Altima',
      'year': 2020,
      'mpg': 32,
      'weight': 3208,
      'fullTank': 476
    });
    await db.insert('CarDetails', {
      'make': 'Mazda',
      'model': 'CX-5',
      'year': 2020,
      'mpg': 26,
      'weight': 3552,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Forester',
      'year': 2020,
      'mpg': 29,
      'weight': 3449,
      'fullTank': 464
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'F-Series',
      'year': 2019,
      'mpg': 25,
      'weight': 4021,
      'fullTank': 676
    });
    await db.insert('CarDetails', {
      'make': 'RAM',
      'model': 'Pickup',
      'year': 2019,
      'mpg': 22,
      'weight': 4798,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Silverado',
      'year': 2019,
      'mpg': 23,
      'weight': 4257,
      'fullTank': 528
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'RAV4',
      'year': 2019,
      'mpg': 30,
      'weight': 3370,
      'fullTank': 449
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'CR-V',
      'year': 2019,
      'mpg': 30,
      'weight': 3337,
      'fullTank': 410
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Camry',
      'year': 2019,
      'mpg': 32,
      'weight': 3310,
      'fullTank': 476
    });
    await db.insert('CarDetails', {
      'make': 'Chevrolet',
      'model': 'Equinox',
      'year': 2019,
      'mpg': 28,
      'weight': 3274,
      'fullTank': 392
    });
    await db.insert('CarDetails', {
      'make': 'Honda',
      'model': 'Civic',
      'year': 2019,
      'mpg': 33,
      'weight': 2877,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Corolla',
      'year': 2019,
      'mpg': 33,
      'weight': 2910,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Tacoma',
      'year': 2019,
      'mpg': 21,
      'weight': 4445,
      'fullTank': 441
    });
    await db.insert('CarDetails', {
      'make': 'Toyota',
      'model': 'Highlander',
      'year': 2019,
      'mpg': 24,
      'weight': 4145,
      'fullTank': 437
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Grand Cherokee',
      'year': 2019,
      'mpg': 22,
      'weight': 4238,
      'fullTank': 484
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Explorer',
      'year': 2019,
      'mpg': 24,
      'weight': 4345,
      'fullTank': 456
    });
    await db.insert('CarDetails', {
      'make': 'Jeep',
      'model': 'Wrangler',
      'year': 2019,
      'mpg': 20,
      'weight': 3948,
      'fullTank': 420
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Escape',
      'year': 2019,
      'mpg': 28,
      'weight': 3274,
      'fullTank': 392
    });
    await db.insert('CarDetails', {
      'make': 'Nissan',
      'model': 'Altima',
      'year': 2019,
      'mpg': 32,
      'weight': 3208,
      'fullTank': 476
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Outback',
      'year': 2019,
      'mpg': 29,
      'weight': 3637,
      'fullTank': 522
    });
    await db.insert('CarDetails', {
      'make': 'Subaru',
      'model': 'Forester',
      'year': 2019,
      'mpg': 29,
      'weight': 3449,
      'fullTank': 464
    });
    await db.insert('CarDetails', {
      'make': 'Hyundai',
      'model': 'Elantra',
      'year': 2019,
      'mpg': 33,
      'weight': 2844,
      'fullTank': 396
    });
    await db.insert('CarDetails', {
      'make': 'Ford',
      'model': 'Fusion',
      'year': 2019,
      'mpg': 27,
      'weight': 3472,
      'fullTank': 476
    });
  }

  Future<List<Map<String, dynamic>>> searchCar(
      String make, String model, int year) async {
    Database db = await instance.database;
    return await db.query(
      'CarDetails',
      where: 'make = ? AND model = ? AND year = ?',
      whereArgs: [make, model, year],
    );
  }
}
