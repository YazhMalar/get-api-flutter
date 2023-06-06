// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postjson.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostJson> _$postJsonSerializer = new _$PostJsonSerializer();
Serializer<Post> _$postSerializer = new _$PostSerializer();

class _$PostJsonSerializer implements StructuredSerializer<PostJson> {
  @override
  final Iterable<Type> types = const [PostJson, _$PostJson];
  @override
  final String wireName = 'PostJson';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Post)),
    ];

    return result;
  }

  @override
  PostJson deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(Post))! as Post);
          break;
      }
    }

    return result.build();
  }
}

class _$PostSerializer implements StructuredSerializer<Post> {
  @override
  final Iterable<Type> types = const [Post, _$Post];
  @override
  final String wireName = 'Post';

  @override
  Iterable<Object?> serialize(Serializers serializers, Post object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userid',
      serializers.serialize(object.userid,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Post deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userid':
          result.userid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PostJson extends PostJson {
  @override
  final Post data;

  factory _$PostJson([void Function(PostJsonBuilder)? updates]) =>
      (new PostJsonBuilder()..update(updates))._build();

  _$PostJson._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'PostJson', 'data');
  }

  @override
  PostJson rebuild(void Function(PostJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostJsonBuilder toBuilder() => new PostJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostJson && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostJson')..add('data', data))
        .toString();
  }
}

class PostJsonBuilder implements Builder<PostJson, PostJsonBuilder> {
  _$PostJson? _$v;

  PostBuilder? _data;
  PostBuilder get data => _$this._data ??= new PostBuilder();
  set data(PostBuilder? data) => _$this._data = data;

  PostJsonBuilder();

  PostJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostJson;
  }

  @override
  void update(void Function(PostJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostJson build() => _build();

  _$PostJson _build() {
    _$PostJson _$result;
    try {
      _$result = _$v ?? new _$PostJson._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Post extends Post {
  @override
  final String userid;
  @override
  final String title;
  @override
  final String body;
  @override
  final int id;

  factory _$Post([void Function(PostBuilder)? updates]) =>
      (new PostBuilder()..update(updates))._build();

  _$Post._(
      {required this.userid,
      required this.title,
      required this.body,
      required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userid, r'Post', 'userid');
    BuiltValueNullFieldError.checkNotNull(title, r'Post', 'title');
    BuiltValueNullFieldError.checkNotNull(body, r'Post', 'body');
    BuiltValueNullFieldError.checkNotNull(id, r'Post', 'id');
  }

  @override
  Post rebuild(void Function(PostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostBuilder toBuilder() => new PostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        userid == other.userid &&
        title == other.title &&
        body == other.body &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userid.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Post')
          ..add('userid', userid)
          ..add('title', title)
          ..add('body', body)
          ..add('id', id))
        .toString();
  }
}

class PostBuilder implements Builder<Post, PostBuilder> {
  _$Post? _$v;

  String? _userid;
  String? get userid => _$this._userid;
  set userid(String? userid) => _$this._userid = userid;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  PostBuilder();

  PostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userid = $v.userid;
      _title = $v.title;
      _body = $v.body;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Post;
  }

  @override
  void update(void Function(PostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Post build() => _build();

  _$Post _build() {
    final _$result = _$v ??
        new _$Post._(
            userid: BuiltValueNullFieldError.checkNotNull(
                userid, r'Post', 'userid'),
            title:
                BuiltValueNullFieldError.checkNotNull(title, r'Post', 'title'),
            body: BuiltValueNullFieldError.checkNotNull(body, r'Post', 'body'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'Post', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
