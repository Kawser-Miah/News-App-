// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NewsDao? _newsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ArticlesModel` (`tableId` INTEGER PRIMARY KEY AUTOINCREMENT, `author` TEXT, `title` TEXT, `description` TEXT, `url` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Source` (`tableId` INTEGER PRIMARY KEY AUTOINCREMENT, `id` TEXT, `name` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NewsDao get newsDao {
    return _newsDaoInstance ??= _$NewsDao(database, changeListener);
  }
}

class _$NewsDao extends NewsDao {
  _$NewsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _articlesModelInsertionAdapter = InsertionAdapter(
            database,
            'ArticlesModel',
            (ArticlesModel item) => <String, Object?>{
                  'tableId': item.tableId,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                }),
        _sourceInsertionAdapter = InsertionAdapter(
            database,
            'Source',
            (Source item) => <String, Object?>{
                  'tableId': item.tableId,
                  'id': item.id,
                  'name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ArticlesModel> _articlesModelInsertionAdapter;

  final InsertionAdapter<Source> _sourceInsertionAdapter;

  @override
  Future<List<ArticlesModel>> getAllNewsFromDb() async {
    return _queryAdapter.queryList('SELECT * FROM ArticlesModel',
        mapper: (Map<String, Object?> row) => ArticlesModel(
            tableId: row['tableId'] as int?,
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?,
            publishedAt: row['publishedAt'] as String?,
            content: row['content'] as String?));
  }

  @override
  Future<int?> deleteAllNews() async {
    return _queryAdapter.query('DELETE FROM ArticlesModel',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Source>> getAllNewsSourceFromDb() async {
    return _queryAdapter.queryList('SELECT * FROM Source',
        mapper: (Map<String, Object?> row) => Source(
            tableId: row['tableId'] as int?,
            id: row['id'] as String?,
            name: row['name'] as String?));
  }

  @override
  Future<int?> deleteAllNewsSource() async {
    return _queryAdapter.query('DELETE FROM Source',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<int> insertNews(ArticlesModel articlesModel) {
    return _articlesModelInsertionAdapter.insertAndReturnId(
        articlesModel, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertNewsSource(Source source) {
    return _sourceInsertionAdapter.insertAndReturnId(
        source, OnConflictStrategy.abort);
  }
}
