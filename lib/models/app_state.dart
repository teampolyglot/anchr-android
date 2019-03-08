import 'package:anchr_android/models/link_collection.dart';

class AppState {
  bool isLoading;
  String user;
  List<LinkCollection> _collections;
  LinkCollection activeCollection;

  AppState({collections = const [], this.activeCollection, this.isLoading = false, this.user});

  factory AppState.loading() => AppState(isLoading: true);

  String get title => this.activeCollection?.name ?? 'Collections';

  bool get hasData => _collections != null && _collections.length > 0 && this.activeCollection != null;

  List<LinkCollection> get collections {
    _collections.sort();
    return _collections;
  }

  set collections(List<LinkCollection> val) => _collections = val;

  AppState copyWith({List<LinkCollection> collections, LinkCollection activeCollection, String user, bool isLoading}) {
    return AppState(
      collections: collections ?? _collections,
      activeCollection: activeCollection ?? this.activeCollection,
      user: user ?? this.user,
      isLoading: isLoading ?? (collections == null && activeCollection == null),
    );
  }
}
